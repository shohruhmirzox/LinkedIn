# LinkedIn
A Claude-powered LinkedIn content toolkit for drafting posts, comments, replies, carousels, DMs, weekly content plans, profile audits, and human-reviewed copy. Includes voice personalization, draft tracking, and local text-quality checks. No automated posting or messaging.

# LinkedIn Agent Skill

A Claude-powered toolkit for LinkedIn content creation, personal branding, engagement planning, and profile optimization.

Turn real projects, experiences, and ideas into LinkedIn content that sounds like you. Draft, review, refine, and publish manually, with Claude handling the writing workflow and local scripts checking drafts.

## Overview

LinkedIn Agent Skill is a collection of 11 Claude skills designed to support the everyday work of managing a LinkedIn presence.

It helps you:

* Write LinkedIn posts using structured hook formulas.
* Draft thoughtful comments and replies.
* Create carousel content.
* Develop connection notes and direct-message drafts.
* Build weekly content and engagement plans.
* Repurpose long-form content into multiple posts.
* Review and optimize your LinkedIn profile.
* Organize inbox items and prioritize conversations.
* Audit published content and track writing patterns.
* Refine drafts with local text-quality checks.
* Maintain a consistent voice without inventing achievements or metrics.

**Core principle: Claude drafts. You review and publish.**

The toolkit is designed around human approval. It does not require your LinkedIn password, and its documented workflow does not automatically log in, publish posts, or send messages.

## Features

### 1. Eleven Claude skills

| Command         | Purpose                                                                                     |
| --------------- | ------------------------------------------------------------------------------------------- |
| `/li-post`      | Generate post hooks, write a complete post, refine the draft, and produce a review receipt. |
| `/li-comment`   | Draft relevant comments on other people's posts.                                            |
| `/li-reply`     | Categorize comments on your posts and draft appropriate replies.                            |
| `/li-profile`   | Score a LinkedIn profile against a 100-point rubric and recommend improvements.             |
| `/li-plan`      | Build a weekly posting schedule and engagement list.                                        |
| `/li-human`     | Run text-quality checks, flag generic writing patterns, and clean formatting.               |
| `/li-carousel`  | Develop content for LinkedIn document and carousel posts.                                   |
| `/li-repurpose` | Transform longer content into multiple LinkedIn posts.                                      |
| `/li-dm`        | Draft connection notes and direct messages for manual review.                               |
| `/li-inbox`     | Organize inbox items and help prioritize conversations.                                     |
| `/li-audit`     | Review published content and identify patterns and opportunities to improve.                |

Exact behavior depends on the instructions and supporting files included with each skill.

### 2. Personalized writing voice

The toolkit uses a local voice profile to guide content creation.

The profile can define:

* Your background, audience, and professional positioning.
* Preferred tone, vocabulary, sentence length, and writing habits.
* Opinions and perspectives you want to communicate.
* Topics and claims that are off-limits.
* Verified achievements, metrics, and stories approved for public use.

The voice profile lives at:

`~/.claude/linkedin/voice.md`

For better results, create it from three examples of your actual writing. Review the generated profile and confirm every factual claim before using it.

### 3. Content planning and tracking

The documented workflow uses three local files:

| File       | Purpose                                                                      |
| ---------- | ---------------------------------------------------------------------------- |
| `voice.md` | Defines your writing voice, audience, boundaries, and verified proof points. |
| `plan.md`  | Stores your weekly content schedule and engagement plan.                     |
| `log.md`   | Tracks approved posts and their hook choices for later review.               |

These files help maintain continuity across sessions. They are local files, not a live connection to LinkedIn.

### 4. Local text-quality checks

The `li-human` skill includes Python scripts for cleaning and evaluating drafts.

The documented checks cover:

* **Burstiness:** Variation in sentence length.
* **Specificity:** Concrete details, names, and numbers.
* **Slop density:** Frequency of generic or overused phrases.
* **Fingerprint:** Selected formatting patterns and invisible characters.
* **Voice:** Contractions, point of view, and structural patterns.

The scripts can clean certain formatting issues, flag lines that need human judgment, and compare draft-quality scores.

These are heuristic writing checks. They do not prove that a text was written by a human or guarantee any AI-detector result.

## How it works

1. **Provide real inputs.** Share an idea, project update, post, conversation, or profile section.
2. **Generate drafts.** Claude selects an appropriate skill and follows its instructions.
3. **Personalize the writing.** The voice profile guides tone, positioning, and style.
4. **Review the draft.** Humanizer checks may identify formatting issues or generic language.
5. **Verify the facts.** Confirm every metric, claim, name, and anecdote.
6. **Approve manually.** Edit the draft and copy it into LinkedIn yourself.
7. **Learn from the result.** Record approved posts and use performance observations to inform future content.

## Installation

### Option A: Claude Code skill installation

The upstream project documents a local installation using Claude Code.

Prerequisites:

* Claude Code and an eligible Claude account.
* Git for cloning the repository.
* Python 3 for the local humanizer scripts.

The documented upstream installation commands are:

```bash
git clone https://github.com/avi691/linkedin-agent-skill.git

mkdir -p ~/.claude/skills

cp -r linkedin-agent-skill/skills/li-* ~/.claude/skills/
```

Restart Claude Code if the commands are not recognized immediately.

**Important:** These commands install skills from the upstream repository. They do not automatically install the contents of this repository. If you are using a fork or customized copy, inspect its directory structure and use the appropriate source path.

### Option B: Install as a Claude Code plugin

The upstream project documents these commands:

```text
/plugin marketplace add avi691/linkedin-agent-skill
/plugin install linkedin-agent@linkedin-agent-skill
```

Plugin commands may include a prefix, such as `/linkedin-agent:li-post`.

### Option C: Use Claude's web interface

The upstream guide also describes uploading individual skill folders as ZIP files through Claude's skill interface. Each ZIP must contain the relevant skill folder and its `SKILL.md`.

The local file paths and Python scripts used by Claude Code are not automatically accessible to Claude's web interface.

## Configuration

### Set up your voice profile

Start with three real LinkedIn posts or other writing samples that represent your natural voice.

Ask Claude to create a profile using the repository's `templates/voice.md` template, if present, and save it to:

```text
~/.claude/linkedin/voice.md
```

Review the profile before using it. Add only metrics and stories that you can verify and are comfortable sharing publicly.

### Verify installation

Check that Claude can discover the skills:

```text
/li
```

Or ask Claude which LinkedIn skills are available.

Test a draft with fictional or clearly labeled sample data:

```text
/li-post [a verified project update or test scenario]
```

The upstream guide expects a post workflow to return three hook options, a full draft, and a `POST READY` receipt.

Test the humanizer from the installed skill directory:

```bash
cd ~/.claude/skills/li-human

python3 detect.py SKILL.md
```

On Windows, use `python` if `python3` is unavailable.

These commands are verification steps, not proof that every skill or integration works. Confirm the output in your own environment.

## Suggested weekly workflow

* **Plan:** Choose content based on actual work, experiments, lessons, and opinions.
* **Draft:** Use `/li-post` or `/li-repurpose`.
* **Engage:** Use `/li-comment` and `/li-reply` to prepare thoughtful responses.
* **Connect:** Use `/li-dm` to draft personalized messages.
* **Optimize:** Use `/li-profile` to identify profile improvements.
* **Review:** Use `/li-audit` to examine content patterns.
* **Repeat:** Use observed results to improve future drafts.

A useful content mix includes project evidence, technical lessons, informed opinions, personal stories, and relevant offers. Prioritize useful specifics over generic motivational content.

## Privacy and safety

* Never provide your LinkedIn password, session cookies, or authentication tokens to a skill.
* Do not assume the toolkit can read your private LinkedIn inbox, analytics, or account activity automatically.
* Provide the actual posts, profile sections, or other material you want analyzed.
* Review commands and scripts before running them.
* Keep private information, confidential business data, and unapproved claims out of public drafts.
* Manually review all posts and messages before publishing or sending them.
* Check LinkedIn's current terms and applicable platform rules before introducing any account integration or automation.

The documented humanizer scripts operate on local files. Text you submit to Claude is still subject to the terms and data-handling practices of your Claude account.

## Project structure

The upstream project documents a structure similar to:

```text
linkedin-agent-skill/
├── skills/
│   ├── li-post/
│   │   ├── SKILL.md
│   │   └── hooks.json
│   ├── li-human/
│   │   ├── SKILL.md
│   │   ├── humanize.py
│   │   ├── detect.py
│   │   └── slop.json
│   ├── li-profile/
│   │   ├── SKILL.md
│   │   └── rubric.json
│   ├── li-comment/
│   ├── li-reply/
│   ├── li-plan/
│   ├── li-carousel/
│   ├── li-repurpose/
│   ├── li-dm/
│   ├── li-inbox/
│   └── li-audit/
├── templates/
│   └── voice.md
├── .claude-plugin/
├── README.md
└── LICENSE
```

Use the actual contents of your repository as the source of truth. A fork or customized repository may differ from this layout.

## Attribution and license

This toolkit is based on the LinkedIn Agent Skill project shared by Avi Grondin:

https://github.com/avi691/linkedin-agent-skill

The installation guide credits Jake Schincariol (`opusjake.ai`) as the original creator and identifies the project as MIT-licensed.

If this repository includes or modifies upstream code, retain the applicable copyright and license notices, including the MIT `LICENSE` file. Clearly distinguish your own modifications from upstream work.

## Limitations

* Draft quality depends on the accuracy and specificity of the information supplied.
* A voice profile improves consistency but cannot fully reproduce a person's judgment or lived experience.
* Text-quality scores are heuristics, not objective proof of authenticity.
* Local logs do not automatically contain LinkedIn performance analytics.
* Profile audits are only as complete as the profile information provided.
* Manual review remains necessary for factual accuracy, tone, privacy, and platform compliance.

## Credits

Built around Claude skills for more deliberate LinkedIn writing, content planning, profile improvement, and engagement.

Upstream project: https://github.com/avi691/linkedin-agent-skill
