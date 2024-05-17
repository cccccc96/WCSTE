//
// Created by 蔡正海 on 2023/6/25.
//

//#include "formula_compiler.h"

#include <iostream>
#include <string>
#include <unordered_map>
#include <stack>
// #include "smt-switch/smt.h"

bool isOperator(char c) {
  return c == '&' || c == '|' || c == '!' 
          || c == '=' || c == '+' ;
}

int getPriority(char c) {
  if (c == '!') {
    return 100;
  } else if (c == '&') {
    return 90;
  } else if (c == '|') {
    return 80;
  } else if (c == '+') {
    return 70;
  }else if (c == '=') {
    return 40;
  }else {
    return 0;
  }
}

smt::Term performOperation(smt::SmtSolver solver_,smt::Term operand1, smt::Term operand2, char op) {
  if (op == '&') {
    return solver_->make_term(smt::And,operand1,operand2);
  } else if (op == '|') {
    return solver_->make_term(smt::Or,operand1,operand2);
  } else if (op == '!') {
    return solver_->make_term(smt::Not,operand1);
  } else if (op == '+') {
    return solver_->make_term(smt::BVAdd,operand1,operand2);
  }else if (op == '=') {
    return solver_->make_term(smt::Equal,operand1,operand2);
  }else {
    assert("guard error!");
    return solver_->make_term(false);
  }
}

smt::Term parseLogicExpression(const smt::SmtSolver solver_,const std::string& expression) {
  std::stack<smt::Term> operands;
  std::stack<char> operators;

  for (size_t i = 0; i < expression.length(); ++i) {
    char c = expression[i];

    if (c == ' ') {
      continue; // 忽略空格
    }

    if (isOperator(c)) {
      // 处理运算符
      while (!operators.empty() && getPriority(operators.top()) >= getPriority(c)) {
        char op = operators.top();
        operators.pop();

        if (op == '!') {
          smt::Term operand = operands.top();
          operands.pop();
          operands.push(performOperation(solver_,operand, solver_->make_term(false), op));
        } else {
          smt::Term operand2 = operands.top();
          operands.pop();
          smt::Term operand1 = operands.top();
          operands.pop();
          operands.push(performOperation(solver_,operand1, operand2, op));
        }
      }

      operators.push(c);
    } else if (c == '(') {
      // 左括号入栈
      operators.push(c);
    } else if (c == ')') {
      // 处理右括号
      while (!operators.empty() && operators.top() != '(') {
        char op = operators.top();
        operators.pop();

        if (op == '!') {
          smt::Term operand = operands.top();
          operands.pop();
          operands.push(performOperation(solver_,operand, solver_->make_term(false), op));
        } else {
          smt::Term operand2 = operands.top();
          operands.pop();
          smt::Term operand1 = operands.top();
          operands.pop();
          operands.push(performOperation(solver_,operand1, operand2, op));
        }
      }

      if (!operators.empty() && operators.top() == '(') {
        operators.pop(); // 弹出左括号
      }
    } else {
      // 处理操作数
      std::string variable;
      while (i < expression.length() && !isOperator(expression[i]) && expression[i] != ' ') {
        variable += expression[i];
        i++;
      }
      i--; // 退回一个字符，以便下一轮循环继续处理

      //压入符号变量
      operands.push(solver_->get_symbol(variable));


    }
  }

  // 处理剩余的运算符
  while (!operators.empty()) {
    char op = operators.top();
    operators.pop();

    if (op == '!') {
      smt::Term operand = operands.top();
      operands.pop();
      operands.push(performOperation(solver_,operand, solver_->make_term(false), op));
    } else {
      smt::Term operand2 = operands.top();
      operands.pop();
      smt::Term operand1 = operands.top();
      operands.pop();
      operands.push(performOperation(solver_,operand1, operand2, op));
    }
  }

  return operands.top();
}