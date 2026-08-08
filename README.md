# Math Question Generation

<img width="598" height="598" alt="logo" src="https://github.com/user-attachments/assets/260eee04-2922-4ae2-b033-c5a3da8f88c5" />

<p align="center">
  <b>English</b> · <a href="./README.zh-CN.md"><b>简体中文</b></a>
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
  A web-based mathematics problem generation system built with <b>Python Flask</b> and <b>OCaml</b>, designed to generate <b><i>PGML (Problem Generation Markup Language)</i></b> code and render WeBWorK-style exercises.
</p>

<p align="center">
<b>A PGML Code Generator for WeBWorK-style mathematics problems.</b>
</p>

<p align="center">
  <b><a href="https://mathproblemgenerator.cn" target="_blank" rel="noopener noreferrer">Live Website</a> · <a href="https://github.com/Smart-Jason/PGML-Code-Generation.git" target="_blank" rel="noopener noreferrer">GitHub Repository</a></b>
</p>

This project presents a web-based mathematics problem generation system that transforms a student identifier into structured PGML code, rendered WeBWorK-style exercises, and inspectable AST output. It combines formal grammar methods, OCaml-based generation, Flask-based interaction, and optional LLM-assisted context enrichment into a single end-to-end workflow.

## Highlights

- Generate mathematics problems directly from a student ID
- Produce real PGML output compatible with WeBWorK-style rendering
- Support arithmetic, set, vector, and derivative problem families
- Render previewed questions inside the web interface
- Inspect generated AST structure for structural verification
- Review, copy, and refine PGML in an editor-oriented workflow
- Switch both UI language and generated problem language
- Enrich arithmetic problems with contextual wording through LLM prompting

## Live Demo

The deployed website is available here:

**[mathproblemgenerator.cn](https://mathproblemgenerator.cn)**

> Note: `/generator_release_v1.1` is still a much much older release. The newest version of the codebase will be uploaded in the future.

## Abstract

This project develops a grammar-based system that automatically generates unique, syntactically correct, and pedagogically equivalent mathematics questions encoded as Problem Generation Markup Language (PGML) usable in WeBWorK-style systems. The generator accepts a student identifier (e.g., student ID) and produces a .pg file containing one or more PGML problems tailored to that identifier. Core contributions include (1) a distilled context-free grammar (CFG) for PGML extracted from real-world WeBWorK samples, (2) a generation pipeline inspired by compiler techniques (AST -> DCST -> CST -> document -> render) implemented with Menhir-style tooling, (3) support for four problem families (arithmetic, set, vector, derivative), and (4) a configurable difficulty-control interface plus LLM-assisted contextual text generation with prompt-engineering safeguards (chain-of-thought, ICL selection). Implemented in OCaml using the Menhir parser generator, the tool demonstrates the feasibility of formal language methods in educational technology.

## Methodology

The core of our math question generation system is a grammar-based approach, fundamentally inspired by techniques from compiler design. Unlike template-based or random substitution methods, our methodology treats the generation of valid Problem Generation Markup Language (PGML) code as a process inverse to parsing, known as unparsing. This foundational choice ensures the syntactic correctness and structural integrity of every generated problem. The implementation is carried out in OCaml, utilizing the Menhir parser generator, which provides the necessary framework for defining a formal grammar and orchestrating the generation pipeline.

## Supported Problem Types

The generator is designed to produce a diverse set of mathematical problems, each mapped to a distinct domain within the undergraduate curriculum. This variety ensures the tool's utility across multiple topics in a typical mathematics or engineering course. The system currently supports **FOUR** core problem types:

- _Arithmetic_
- _Set Operations_
- _Vector Operations_
- _Differential Calculus_

For each type, a dedicated subset of the formal PGML grammar has been developed, governing not only the syntactic structure of the question text but also the accompanying computational logic for answer generation and validation within the WeBWorK system.

## Difficulty Control

To ensure the generated problem sets are pedagogically appropriate for diverse student cohorts and learning objectives, the generator incorporates a comprehensive, hierarchical system for difficulty control.

This system operates on two interconnected levels: a set of global parameters that govern the overall structure of an assignment, and a suite of fine-grained, type-specific parameters that tailor the intrinsic complexity of each individual problem. This dual-layer approach grants instructors precise control over the challenge presented to students, enabling the creation of everything from foundational practice sets to advanced assessments.

## Problem Context & LLM-Backed Context Generation

In traditional digital mathematics education, "context rigidity" and "scale limitation" often pose significant bottlenecks for problem generation. This work addresses these issues by incorporating Large Language Models (LLMs) through generative AI technologies, providing a scalable and personalized solution for educational content creation. We provide a detailed account of the problem context generation methodology, aiming to serve as an empirical case study for AI in educational assessment.
