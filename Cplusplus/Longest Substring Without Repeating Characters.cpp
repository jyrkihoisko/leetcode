// Example program
#include <iostream>
#include <string>
#include <vector>
#include <cassert>
#include <map>

using namespace std;
struct ListNode;

void print(std::vector <int> const &a) {
   std::cout << "The vector elements are : ";
   for(int i = 0; i < a.size(); ++i)
   std::cout << a.at(i) << ' ';
}

/**
 * Definition for singly-linked list.
 */
struct ListNode {
  int val;
  ListNode *next;
  ListNode() : val(0), next(nullptr) {}
  ListNode(int x) : val(x), next(nullptr) {}
  ListNode(int x, ListNode *next) : val(x), next(next) {}
};

void printList(struct ListNode *p) {
  for(; p; p = p->next)
    printf("%d ", p->val);
  printf("\n");
}

class Solution {
public:
  int lengthOfLongestSubstring(string s) {
    int count = 0;
    int maxRes = 0;
    map<char, int> m;
    //for (char ch = ' '; ch <= '~'; ++ch) { m[ch] = -1; }
    for (int i = 0; i < s.length(); i++) {        
      if (m[s[i]] == 0) { // No char index
        m[s[i]] = i+1;
        count += 1;
      } else { // Char was found before
        if (m[s[i]]-1 + count < i) {
          m[s[i]] = i+1;
          count += 1;
        } else {                
          maxRes = max(count, maxRes);
          if (m[s[i]] > 1) {
            count = (i - m[s[i]]+1);
          }                
          m[s[i]] = i+1;
        }             
      }        
    }
    maxRes = max(count, maxRes);
    return maxRes;
/*
toimii;
    while (i < s.size() && j < s.size()) {
      char ch = s[j];
      cout << " evaluating: " << ch << "\n";
      charMap = {};
      bool substringOk = true;

      for (int x = i; x <= j; ++x) {
        if (charMap[s[x]] == true) {
          substringOk = false;
          break; 
        } else {
          charMap[s[x]] = true;
        }
      }
      if (substringOk) {
        j += 1;
        ret = max(ret, j-i);
      } else {
        j += 1;
        i += 1;
      }
    }
    cout << "returning: " << ret << "\n";
    return ret;

*/
  }
};

int main()
{
  string name = "jyrki";
  //std::cout << "What is your name? ";
  //getline (std::cin, name); 
  cout << "Hello you bastard, " << name << "!\n";
  Solution s = Solution();
  s.lengthOfLongestSubstring("pwwkew");
  s.lengthOfLongestSubstring("dvdf");
//  return 0;
  assert(s.lengthOfLongestSubstring("abcdd") == 4);
  assert(s.lengthOfLongestSubstring("pwwkew") == 3);
  assert(s.lengthOfLongestSubstring("abcabcbb") == 3);
  assert(s.lengthOfLongestSubstring("a") == 1);
  assert(s.lengthOfLongestSubstring("bbbbb") == 1);
  assert(s.lengthOfLongestSubstring("") == 0);
  assert(s.lengthOfLongestSubstring("abcdefgh") == 8);
  assert(s.lengthOfLongestSubstring("abcdefgg") == 7);
  assert(s.lengthOfLongestSubstring("aacdefgh") == 7);
  assert(s.lengthOfLongestSubstring("dvdf") == 3);
  assert(s.lengthOfLongestSubstring("dvdfd") == 3);
  assert(s.lengthOfLongestSubstring("tmmzuxt") == 5);
}
