// RUN: clang-format -style="{AllowShortCaseLabelsOnASingleLine: true}" %s > %t
// RUN: diff %s %t
#define X                                                                      \
  case 0: break;
#include "f"
