# 数学题目生成系统

<p align="center">
  <a href="./README.md"><b>English</b></a> · <b>简体中文</b>
</p>

<p align="center">
  <img alt="Python Flask" src="https://img.shields.io/badge/Python-Flask-3776AB?style=for-the-badge&logo=python&logoColor=white" />
  <img alt="OCaml" src="https://img.shields.io/badge/OCaml-Generator-EC6813?style=for-the-badge&logo=ocaml&logoColor=white" />
  <img alt="WeBWorK" src="https://img.shields.io/badge/WeBWorK-Renderer-2F855A?style=for-the-badge" />
  <img alt="PGML" src="https://img.shields.io/badge/PGML-Code_Generation-5B4BDB?style=for-the-badge" />
  <img alt="LLM" src="https://img.shields.io/badge/LLM-Context_Enrichment-C96C1A?style=for-the-badge" />
  <img alt="Status" src="https://img.shields.io/badge/Status-MVP-success?style=for-the-badge" />
</p>

<p align="center">
  一个基于 <b>Python Flask</b> 与 <b>OCaml</b> 构建的网页端数学题目生成系统，可生成 <b><i>PGML（Problem Generation Markup Language）</i></b> 代码并渲染 WeBWorK 风格题目。
</p>

<p align="center">
<b>一个面向 WeBWorK 风格数学题目的 PGML 代码生成系统。</b>
</p>

<p align="center">
  <b><a href="https://mathproblemgenerator.cn" target="_blank" rel="noopener noreferrer">在线网站</a> · <a href="https://github.com/Smart-Jason/PGML-Code-Generation.git" target="_blank" rel="noopener noreferrer">GitHub 仓库</a></b>
</p>

本项目实现了一个网页端数学题目生成系统，能够将学生学号转换为结构化 PGML 代码、可渲染的 WeBWorK 风格题目，以及可检查的 AST 输出。系统将形式文法方法、基于 OCaml 的生成逻辑、基于 Flask 的交互界面，以及可选的 LLM 语境补充能力整合为一条端到端工作流。

## 亮点

- 根据学生学号直接生成数学题目
- 生成可在真实 WeBWorK 风格流程中使用的 PGML 代码
- 支持算术题、集合题、向量题和导数题四类题型
- 在网页界面内直接预览渲染后的题目效果
- 支持查看生成 AST，进行结构检查
- 支持复制、查看与进一步微调生成的 PGML
- 同时支持界面语言和题目语言切换
- 支持借助 LLM 为算术题补充题面语境

## 在线演示

已部署网站地址：

**[mathproblemgenerator.cn](https://mathproblemgenerator.cn)**

> 说明：`/generator_release_v1.1` 仍然是一个非常早期的旧版本，更新的最新版代码将在后续上传。

## 摘要

本项目开发了一个基于文法的数学题目自动生成系统，可自动生成唯一、语法正确且在教学上等价的数学题目，并将其编码为可用于 WeBWorK 风格系统的 Problem Generation Markup Language（PGML）。生成器接受一个学生标识（如学号）作为输入，输出一个包含一道或多道 PGML 题目的 `.pg` 文件，并使其与该标识相对应。项目的核心贡献包括：（1）从真实 WeBWorK 样本中提炼出的 PGML 上下文无关文法（CFG）；（2）受编译器技术启发的生成流水线（AST -> DCST -> CST -> document -> render），并以 Menhir 风格工具实现；（3）对四类题型的支持，即算术、集合、向量与导数；以及（4）包含难度控制界面与基于 LLM 的语境文本生成机制，并结合提示工程防护（如 chain-of-thought 与 ICL 选择）。本系统使用 OCaml 与 Menhir 解析器生成器实现，展示了形式语言方法在教育技术中的可行性。

## 方法论

本数学题目生成系统的核心是一种基于文法的方法，其思想根本上受到编译器设计技术的启发。不同于模板拼接或随机替换的方法，我们将合法 Problem Generation Markup Language（PGML）代码的生成视为解析的逆过程，即 unparsing。这样的基础设计能够保证每一道生成题目的语法正确性与结构完整性。系统使用 OCaml 实现，并借助 Menhir 解析器生成器来定义形式文法和组织整个生成流水线。

## 支持的题型

该生成器旨在覆盖本科数学课程中的多类典型题目，以提升其在数学或工程课程场景中的实用性。目前系统支持 **四类** 核心题型：

- _算术题_
- _集合运算题_
- _向量运算题_
- _微分导数题_

对于每一类题型，系统都设计了相应的 PGML 形式文法子集，不仅约束题目文本的语法结构，也定义了答案生成与 WeBWorK 校验逻辑所需的计算表达形式。

## 难度控制

为了使生成的题目集适用于不同学生群体与教学目标，系统引入了一套分层、细粒度的难度控制机制。

这套机制运行于两个相互关联的层面：一层是控制整份作业结构的全局参数，另一层是面向具体题型的细粒度参数，用于调节单个题目的内在复杂度。通过这种双层控制方式，教师可以更加精确地设定题目难度，从基础练习到较高强度的评测都能灵活生成。

## 题目语境与基于 LLM 的语境补充

在传统数字数学教育场景中，“题面语境僵化”与“规模受限”通常是题目生成面临的重要瓶颈。为解决这些问题，本工作将大语言模型（LLM）引入生成式 AI 流程，为教育内容创建提供一种可扩展、可个性化的解决方案。项目详细描述了题目语境生成的方法流程，也希望将其作为 AI 应用于教育测评场景的一个实证案例。
