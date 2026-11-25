# Contributing

Thank you for considering a contribution.

## Before you start

- Open an issue to discuss substantial changes before implementing them.
- Keep changes focused and explain the user-visible behavior they affect.
- Do not include private, confidential, or third-party copyrighted material unless you have permission to contribute it.

## Development checks

Run these commands with the Dart SDK installed:

```bash
dart pub get
dart analyze
dart test
```

## Tests

- Add tests for every new behavior or bug fix.
- Include Arabic, English, mixed-script, punctuation, and digit cases where relevant.
- Avoid claiming full Unicode Bidirectional Algorithm support; this package currently provides only a simplified direction hint.

## Pull requests

Describe the problem, the approach, relevant limitations, and the commands used to validate the change.
