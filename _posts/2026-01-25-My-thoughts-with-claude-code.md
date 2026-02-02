---
title: "Claude Code Tricks I Found After Three Months of Usage"
mathjax: true
author: Eleven Chen
category: Coding
---


## Skills

One of the most powerful features of Claude Code is the ability to create custom skills. If you find yourself frequently asking Claude to perform similar tasks, you can ask Claude to create a reusable skill for you. These skills are stored in `~/.claude/skills` and can be invoked easily in your terminal.

For example, I created a custom skill for searching through PowerPoint presentations. Instead of describing the task repeatedly, I can now simply type `\searchppt` to invoke it. This saves time and makes your workflow much more efficient. 

## API Keys

There are different ways to authenticate and use Claude Code. You can use a Claude subscription (Pro or Max), but be aware that subscriptions come with usage limits—both a rolling limit that resets every few hours and a weekly limit. If you're doing intensive work like refactoring, you'll burn through the hourly limit quickly.

For more flexibility, you can use the Anthropic API key instead. To set this up, export your API key as an environment variable:

```bash
export ANTHROPIC_API_KEY="your-api-key-here"
```

Then log out of Claude Code with `/logout` and choose the API account option when you log back in.

Depending on your setup, you might be logging into an enterprise account, and you may see a warning like this:

```
Auth conflict: Using ANTHROPIC_API_KEY instead of Anthropic Console key. Either unset ANTHROPIC_API_KEY, or run `claude /logout`.
```

This warning is normal and not a problem—it's just letting you know that Claude Code is using your API key instead of your console credentials.

## Plan Mode

Plan Mode is a structured way to tackle complex coding tasks. When you're working on a substantial feature or refactor, use Plan Mode to let Claude break down the work into manageable steps. Claude will create a detailed todo list for your task and may ask you clarifying questions with options to help nail down the requirements.

The beauty of this approach is that you can provide additional details as Claude reasons through the problem, refining the plan iteratively. Once you've agreed on the plan, Claude will execute it step by step, making smaller, focused commits and running tests frequently. This keeps your work organized and makes it easier to catch issues early. 

## Compact Your Conversations

As you work on longer projects, your conversation history will grow. Eventually, you'll approach your context window limit, which can slow down Claude's responses. To prevent this, proactively compact your conversation using the `/compact` command. This summarizes your conversation history, preserving the important context while freeing up space. Running this before you hit the limit ensures Claude can continue working efficiently.

