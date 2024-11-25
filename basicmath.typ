#import "./setup/main.typ": *

#show: project.with(
  title: "Basic Mathmatical",
  authors: (
    "suspen",
  ),
  language: "ch",
  outl: [
    #outline(indent: true, title: "目录", depth: 2)
  ],
  title_page: true
)

#include "basic.typ"
#include "ch1.typ"