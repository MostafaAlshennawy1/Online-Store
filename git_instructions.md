# Git Commands to Push Your Project to GitHub

Here are the step-by-step commands you need to run in your terminal (you can open the Terminal tab at the bottom of Android Studio) to push your project to GitHub.

### Step 1: Initialize Git (Skip if already initialized)
If you haven't turned this folder into a Git repository yet, run this first:
```bash
git init
```

### Step 2: Add All Changed Files
This tells Git to track all the new files and changes we made (Provider, Cart, Favorites, Profile).
```bash
git add .
```

### Step 3: Commit the Changes
This saves a snapshot of the code with a descriptive message.
```bash
git commit -m "Complete online store project with Provider state management, Cart, and Favorites"
```

### Step 4: Link to GitHub (Skip if already linked)
Go to GitHub.com, create a **New Repository** (do not add a README/gitignore), and copy the link it gives you. Run this command, replacing the URL with your own:
```bash
git remote add origin https://github.com/YourUsername/YourRepositoryName.git
```

### Step 5: Push the Code
Finally, push your code to the `main` branch on GitHub:
```bash
git branch -M main
git push -u origin main
```

> **Note:** If you get an error saying the branch is `master`, the `git branch -M main` command above will safely rename it to `main` which is the new GitHub standard.
