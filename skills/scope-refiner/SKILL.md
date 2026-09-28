---
name: scope-refiner
description: Refine already selected and prioritized product or engineering ideas into a bounded, implementation-agnostic Scope Brief. Use when a chosen initiative needs clearer scope boundaries, actors, outcomes, assumptions, constraints, dependencies, and open questions before requirements or architecture work.
---
# Scope Refiner

## Purpose

Refine already explored, selected, and prioritized product or engineering ideas into a clear, bounded, and implementation-agnostic scope.

The output of this skill is a **Scope Brief** intended to serve as an input for later activities such as:

- Product Requirements Document (PRD)
- Functional Requirements
- Non-Functional Requirements
- Architecture Definition
- Technical Discovery
- Delivery Planning

This skill does **not** replace any of those activities.

---

## Core Principle

The input has already gone through exploration, brainstorming, and prioritization.

Do not restart ideation unless the user explicitly asks for it.

The purpose of this skill is convergence:

> Transform "we decided we want to build this" into "we clearly understand what this means and where its boundaries are."

---

# Input

The skill may receive scope information from one of three sources.

## 1. File

If a file containing already defined or prioritized ideas is available, read it first.

Prefer artifacts that clearly contain:

- selected ideas;
- prioritized capabilities;
- product decisions;
- initiatives;
- features;
- problems chosen for implementation.

Do not require a specific filename.

If multiple plausible files exist and it is not possible to confidently determine which one represents the prioritized scope, ask the user which one should be used.

---

## 2. Prompt

If the user provides the ideas directly in the prompt, use them as the source material.

Do not require the user to restructure the information before starting.

Extract the relevant scope from informal notes when possible.

---

## 3. Missing Input

If neither a usable file nor sufficient ideas are provided, ask the user to provide the already explored and prioritized ideas.

Do not start brainstorming on their behalf.

Example:

> Please provide the ideas, capabilities, or initiatives you have already explored and prioritized for this first scope.

---

# Language

The conversation may happen in any language.

Questions may be asked in the user's language.

The final artifact produced by this skill MUST always be written in English.

---

# Responsibilities

The Scope Refiner must determine whether the prioritized ideas are sufficiently clear to support downstream specification.

It should clarify:

- the problem being addressed;
- the target users or actors;
- the intended outcome;
- the business or product intent;
- scope boundaries;
- what is explicitly included;
- what is explicitly excluded;
- relevant use scenarios;
- assumptions;
- constraints;
- dependencies;
- business rules already implied by the scope;
- external systems or actors involved;
- unresolved decisions;
- known risks or uncertainties;
- signals that may later influence functional requirements;
- signals that may later influence non-functional requirements;
- signals that may later influence architecture.

The skill should preserve the user's decisions rather than replacing them.

---

# What This Skill Must Not Do

Do not:

- restart product discovery;
- generate new product ideas unless explicitly requested;
- expand the scope simply because additional features appear useful;
- prioritize features again unless the current prioritization is contradictory;
- write the final PRD;
- define functional requirements;
- define non-functional requirements;
- design the system architecture;
- choose frameworks, databases, cloud providers, or infrastructure;
- create implementation plans;
- create tasks or tickets;
- estimate development effort;
- introduce technical solutions as if they were requirements;
- silently resolve meaningful product ambiguity.

Technical information supplied by the user may be preserved as a constraint, assumption, or prior decision.

---

# Refinement Process

## Step 1 — Understand the Source

Read the provided material completely before asking questions.

Extract:

- selected ideas;
- stated priorities;
- desired outcomes;
- explicit constraints;
- existing decisions;
- stated exclusions;
- unresolved points.

Do not ask questions whose answers are already present in the source.

---

## Step 2 — Normalize the Candidate Scope

Convert the raw ideas into identifiable scope items.

Assign stable identifiers:

- `SCP-001`
- `SCP-002`
- `SCP-003`

Each scope item should initially represent one meaningful capability, outcome, or bounded product concern.

Do not artificially split an idea into implementation tasks.

---

## Step 3 — Detect Ambiguities

Evaluate each scope item for ambiguities that could materially affect downstream requirements, architecture, or product definition.

Prioritize ambiguities related to:

1. scope boundaries;
2. actor or user;
3. expected outcome;
4. behavior or business meaning;
5. dependencies;
6. constraints;
7. ownership of decisions;
8. interactions with external systems;
9. important exceptional scenarios.

Ignore minor uncertainties that can safely be resolved during later requirement analysis.

---

# Questioning Strategy

Ask questions only when their answers can materially change the interpretation of the scope.

Questions should be:

- decision-oriented;
- concise;
- contextual;
- grouped when possible;
- focused on high-impact ambiguity.

Prefer:

> Should imported data become part of our system of record, or should the product always treat Hevy as the authoritative source?

Avoid:

> Can you tell me more about how you imagine the integration?

Prefer concrete decisions over open-ended brainstorming.

---

## Question Priority

Ask questions in this order:

### 1. Blocking Ambiguities

Questions without which the scope cannot be reliably understood.

### 2. Scope Boundaries

What belongs to the first scope and what does not.

### 3. Actors and Outcomes

Who is involved and what successful behavior means.

### 4. Business Rules

Rules already inherent to the intended product behavior.

### 5. Dependencies and Constraints

External systems, organizational constraints, regulations, technical limitations, or prior decisions.

### 6. Relevant Exceptional Scenarios

Only exceptions that materially affect the scope.

Do not exhaustively enumerate edge cases. That belongs to requirements analysis.

---

# Question Batching

Avoid long interview-style conversations when the ambiguity can be resolved efficiently.

Prefer a small batch of related questions.

As a general guideline:

- ask approximately 3–7 high-value questions per round;
- avoid asking 15–20 speculative questions at once;
- after receiving answers, reassess whether additional questions are truly necessary.

Do not continue questioning merely to make the document more detailed.

---

# Handling Unknowns

Not every uncertainty must be solved during scope refinement.

Classify unresolved information as:

### Blocking

The scope cannot safely proceed to downstream analysis without a decision.

### Non-blocking

The issue can be resolved during requirements, architecture, technical discovery, or PRD creation.

Non-blocking uncertainty should not prevent completion of the Scope Brief.

Preserve it explicitly in the output.

---

# Scope Readiness

The scope is ready when downstream specialists can understand what is being proposed without reopening the original brainstorm.

The following should be sufficiently clear:

- [ ] the problem is understood;
- [ ] target actors are identified;
- [ ] intended outcomes are understood;
- [ ] major scope items are identifiable;
- [ ] in-scope boundaries are explicit;
- [ ] important out-of-scope boundaries are explicit;
- [ ] major dependencies are known;
- [ ] important assumptions are visible;
- [ ] known constraints are visible;
- [ ] critical ambiguities are resolved;
- [ ] remaining open questions are classified;
- [ ] the document does not prescribe unnecessary implementation details.

This is the **Definition of Ready for Requirements**.

---

# Output

Produce a new Markdown file named:

`scope-brief.md`

The file MUST be written in English.

Do not modify the original input artifact unless explicitly requested.

---

# Output Structure

The generated file should follow this structure.

```markdown
# Scope Brief

## 1. Context

Short explanation of the initiative and the context that led to this scope.

## 2. Problem

Describe the problem or opportunity being addressed.

Avoid describing the solution as the problem.

## 3. Target Actors

Identify the users, systems, organizations, or external actors directly involved.

For each actor, briefly describe their relationship with the proposed scope.

## 4. Desired Outcomes

Describe what should become possible or meaningfully better if this scope succeeds.

Focus on outcomes rather than implementation.

## 5. Scope Items

### SCP-001 — <Capability or concern name>

**Intent**

Why this item exists.

**Primary actor**

Who primarily interacts with or benefits from it.

**Expected outcome**

What should become possible.

**In scope**

- ...

**Out of scope**

- ...

**Relevant notes**

- ...

---

### SCP-002 — <Capability or concern name>

...

## 6. Cross-Scope Business Rules

Rules that apply across multiple scope items.

Only include rules already known or confirmed during refinement.

## 7. Assumptions

Explicit assumptions currently being made.

For example:

- ASS-001 — ...
- ASS-002 — ...

## 8. Constraints

Known limitations or decisions that downstream work must respect.

For example:

- organizational;
- regulatory;
- product;
- technical;
- operational;
- budget;
- timeline;
- external platform limitations.

Do not invent constraints.

## 9. Dependencies

External systems, teams, APIs, services, decisions, or initiatives that the scope depends on.

## 10. External Integrations

List known systems or external actors with which the proposed scope must interact.

Describe the relationship without designing the integration.

## 11. Scope Boundaries

### Included

Summarize the major capabilities included in the current scope.

### Explicitly Excluded

Summarize important capabilities intentionally deferred or rejected.

## 12. Known Risks and Uncertainties

List uncertainties already visible at the scope level.

Do not perform a complete project risk analysis.

## 13. Signals for Functional Requirements

Capture behaviors, interactions, rules, or scenarios that should be investigated during functional requirements analysis.

Do not convert them into formal requirements yet.

## 14. Signals for Non-Functional Requirements

Capture concerns such as:

- scale;
- latency;
- security;
- privacy;
- availability;
- auditability;
- interoperability;
- accessibility;
- data retention;
- regulatory concerns.

Only include concerns supported by the refined scope.

Do not invent numerical targets.

## 15. Signals for Architecture

Capture facts likely to influence architectural decisions.

Examples:

- dependency on an external API;
- offline behavior;
- multiple clients;
- existing system boundaries;
- system-of-record considerations;
- data ownership;
- integration constraints.

Do not propose an architecture.

## 16. Resolved Decisions

Record meaningful decisions made during the refinement conversation.

Use identifiers:

- DEC-001 — ...
- DEC-002 — ...

## 17. Open Questions

### Blocking

Questions that must be resolved before downstream specification can safely proceed.

### Non-blocking

Questions that may be addressed during PRD, requirements, architecture, or technical discovery.

## 18. Requirements Readiness

**Status:** READY | READY WITH OPEN QUESTIONS | NOT READY

### Rationale

Briefly explain the readiness status.

### Recommended Next Steps

Identify which downstream activities should consume this artifact.

Possible examples:

- Functional Requirements Analysis
- Non-Functional Requirements Analysis
- PRD Definition
- Architecture Discovery
- Domain Research
- Technical Discovery

Do not prescribe unnecessary process steps.
```

---

# Readiness Status Rules

Use:

## READY

Use when there are no meaningful unresolved questions that prevent requirements work.

## READY WITH OPEN QUESTIONS

Use when remaining uncertainties exist but can safely be handled during downstream analysis.

This should be a normal and acceptable result.

## NOT READY

Use only when unresolved decisions would make requirements work misleading, contradictory, or highly speculative.

Clearly identify the blocking questions.

---

# Traceability

Preserve identifiers whenever possible.

Use:

- `SCP-*` for scope items;
- `ASS-*` for assumptions;
- `DEC-*` for resolved decisions.

These identifiers are intended to support later traceability.

Downstream artifacts may reference them, for example:

`FR-012 derives from SCP-003`

or:

`ADR-004 addresses constraint described by SCP-002 and DEC-005`.

---

# Interaction Principles

## Preserve Intent

Never replace the user's product intent with what the model considers a better product.

Suggestions may be raised when they expose ambiguity or contradiction, but the user owns the scope.

---

## Prefer Explicit Boundaries

One of the primary responsibilities of this skill is identifying what the first scope deliberately does **not** include.

Out-of-scope decisions are first-class information.

---

## Avoid Premature Precision

Do not force numerical, technical, or operational details when they have not yet been explored.

For example, do not invent:

- response times;
- user volumes;
- availability targets;
- retention periods;
- technology stacks.

Instead record that the topic may require downstream investigation.

---

## Separate Facts, Decisions, and Assumptions

Do not present assumptions as confirmed facts.

Do not present model suggestions as user decisions.

The final document must make the distinction clear.

---

## Avoid Solution Leakage

A product behavior and a technical implementation are different things.

Example:

Good:

> The user must be able to access previously synchronized workout information when connectivity is temporarily unavailable.

Premature:

> Store workout data in IndexedDB and synchronize it through a service worker.

The first belongs to scope or requirements.

The second belongs to architecture or implementation.

---

# Completion Behavior

Before generating `scope-brief.md`, perform a final internal review:

1. Did I preserve the prioritized ideas?
2. Did I accidentally expand the product?
3. Are important boundaries explicit?
4. Did I distinguish assumptions from decisions?
5. Did I introduce architecture prematurely?
6. Could a requirements analyst understand what must be investigated next?
7. Could an architect understand the relevant constraints without being told how to solve them?
8. Could a product manager use this artifact as an input to a PRD?

If the answers are satisfactory, generate the final artifact.