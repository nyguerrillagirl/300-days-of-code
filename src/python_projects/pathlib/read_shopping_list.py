from pathlib import Path
# The code reads a markdown file named "shopping_list.md" from the current working directory.
# It extracts lines that start with an asterisk (*) and prints them.
path = Path.cwd() / "shopping_list.md"

with path.open(mode="r", encoding="utf-8") as md_file:
    content = md_file.read()
    groceries = [line for line in content.splitlines() if line.startswith("*")]

print("\n".join(groceries))
