from pathlib import Path

source = Path("shopping_list.md")
destination = source.with_stem("shopping_list_02")

# Copy the file
destination.write_bytes(source.read_bytes())