# Math Question Generation (A PGML Code Generator)

The Final Year Project of a Y4 college student.

**PGML (Problem Generation Markup Language)** for *WebWork* Math problems.

****generator_release_v1.1** is actually a super old version, and the newest version of codes will be uploaded in the future.*

## Abstract

This project develops a grammar-based system that automatically generates unique, syntactically correct, and pedagogically equivalent mathematics questions encoded as Problem Generation Markup Language (PGML) usable in WeBWorK-style systems. The generator accepts a student identifier (e.g., student ID) and produces a .pg file containing one or more PGML problems tailored to that identifier. Core contributions include (1) a distilled context-free grammar (CFG) for PGML extracted from real-world WeBWorK samples, (2) a generation pipeline inspired by compiler techniques (AST → DCST → CST → document → render) implemented with Menhir-style tooling, (3) support for four problem families (arithmetic, set, vector, derivative), and (4) a configurable difficulty-control interface plus LLM-assisted contextual text generation with prompt-engineering safeguards (chain-of-thought, ICL selection). Implemented in OCaml using the Menhir parser generator, the tool demonstrates the feasibility of formal language methods in educational technology.

## Methodology

The core of our math question generation system is a grammar-based approach, fundamentally inspired by techniques from compiler design. Unlike template-based or random substitution methods, our methodology treats the generation of valid Problem Generation Markup Language (PGML) code as a process inverse to parsing, known as unparsing. This foundational choice ensures the syntactic correctness and structural integrity of every generated problem. The implementation is carried out in OCaml, utilizing the Menhir parser generator, which provides the necessary framework for defining a formal grammar and orchestrating the generation pipeline.

## Supported Problem Types

The generator is designed to produce a diverse set of mathematical problems, each mapped to a distinct domain within the undergraduate curriculum. This variety ensures the tool's utility across multiple topics in a typical mathematics or engineering course. The system currently supports **FOUR** core problem types: 
- _Arithmetic_,
- _Set Operations_,
- _Vector Operations_,
- and _Differential Calculus_.

For each type, a dedicated subset of the formal PGML grammar has been developed, governing not only the syntactic structure of the question text but also the accompanying computational logic for answer generation and validation within the WeBWork system.

## Difficulty Control

To ensure the generated problem sets are pedagogically appropriate for diverse student cohorts and learning objectives, the generator incorporates a comprehensive, hierarchical system for difficulty control.

This system operates on two interconnected levels: a set of global parameters that govern the overall structure of an assignment, and a suite of fine-grained, type-specific parameters that tailor the intrinsic complexity of each individual problem. This dual-layer approach grants instructors precise control over the challenge presented to students, enabling the creation of everything from foundational practice sets to advanced assessments.

## Problem Context & LLM-Backed Context Generation

In traditional digital mathematics education, "context rigidity" and "scale limitation" often pose significant bottlenecks for problem generation. This work addresses these issues by incorporating Large Language Models (LLMs) through generative AI technologies, providing a scalable and personalized solution for educational content creation. We provide a detailed account of the problem context generation methodology, aiming to serve as an empirical case study for AI in educational assessment.

## Live Demo💡:

Let's try to generate some math problems!

:one: Generate some Math questions using a random student ID:

https://github.com/user-attachments/assets/d132c016-de52-4c99-84f9-3ae2feb59f8d

---

:two: Render the questions in WeBWork:

https://github.com/user-attachments/assets/65e95d72-1b1e-4adb-bf80-b86e59337912

---

:three: Also, try answer checking:

https://github.com/user-attachments/assets/c8720346-e2d8-43e0-a387-0dd974567b83

---

4️⃣ For arithmetic problems, it is allowed to add contexts for generated questions using large language models:

https://github.com/user-attachments/assets/005d8f93-c4ef-4c7c-a96b-39b5b4487969

---

5️⃣ Render the questions in WeBWork:

https://github.com/user-attachments/assets/01f3f48d-e053-401f-aa04-c76ca3171951

---

6️⃣ Do answer checking:

https://github.com/user-attachments/assets/eee62c90-5d04-44c6-a43a-ebffb5e11129

---
