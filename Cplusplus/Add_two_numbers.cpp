// Example program
#include <iostream>
#include <string>
#include <vector>

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
  ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
    //l1 = [2,4,3], l2 = [5,6,4] = [7,0,8]
    int overflow = 0;
    ListNode* result = nullptr;
    ListNode* prev = nullptr;
    ListNode* ret = nullptr;

    while (l1 != nullptr || l2 != nullptr || overflow) {
      int v1 = l1 ? l1->val : 0;
      int v2 = l2 ? l2->val : 0;
      int newVal = v1 + v2 + overflow;
      overflow = newVal > 10 ? 1 : 0; 
      result = new ListNode(newVal);
      if (prev) prev->next = result;
      if (!ret) ret = result;
      prev = result;
      if (l1) l1 = l1->next;
      if (l2) l2 = l2->next;
    }
    return ret;
  }
};

int main()
{
  string name = "jyrki";
  //std::cout << "What is your name? ";
  //getline (std::cin, name);
  cout << "Hello you bastard, " << name << "!\n";
  Solution s = Solution();
  vector v1 {1,2,3,7};
  //auto res = s.twoSum(v1, 5);
  //print(res);
//  cout << res;
}
