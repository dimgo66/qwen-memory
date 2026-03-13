# Files Skill

## Description
File operations skill for reading, writing, and manipulating files.

## Commands
```bash
# Read files
cat <file>
head -n 20 <file>
tail -f <file>

# Search in files
grep -r "pattern" .
grep -rn "pattern" --include="*.js"

# Find files
find . -name "*.ts"
find . -type f -mtime -7

# File operations
cp <src> <dest>
mv <src> <dest>
rm <file>
mkdir -p <dir>

# Permissions
chmod +x <file>
chown <user>:<group> <file>
```

## Usage
Use this skill for file manipulation, searching, and directory operations.
Always confirm before deleting files.
