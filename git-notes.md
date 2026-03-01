
# Step 1 — Check Current Git Identity

Run inside your repo:

```bash id="7ckjz3"
git config user.name
git config user.email
```

It probably shows:

```
USER
USER.EMAIL
```

---

# Step 2 — Set Per-Repo Identity for Notes Repo

Inside the repo you want for `USER_NAME/REPO`:

```bash id="0n6m5q"
git config user.name "USER_ACCOUNT_NAME"
git config user.email "USER_ACCOUNT_EMAIL"
```

> This overrides global Git identity **just for this repository**.

You can confirm:

```bash id="5q7j1v"
git config --get user.email
git config --get user.name
```

Should now show `USER_EMAIL` and `USER_ACCOUNT_NAME`.

---

# Step 3 — Test a Commit

1. Modify a note (e.g., add a blank line)
2. `git status` → shows modified file
3. Commit in Obsidian

Check:

```bash id="k91d4p"
git log -1 --pretty=full
```

You should see:

```
Author: rwxcodestak <USER.NAME>
Committer: rwxcodestak <USER.EMAIL>
```

---

# Step 4 — Push to GitHub

Make sure the remote is pointing to **the correct account repository** (ACCOUNT_NAME/REPO):

```bash id="p8g2h7"
git remote -v
```

If needed, set the correct remote via SSH alias:

```bash id="f0l7k2"
git remote set-url origin git@github-accountB:rayct/notes.git
```

* `github-accountB` is your second GitHub account host alias (`~/.ssh/config`)
* This ensures SSH uses the key for that account.

---

✅ After this:

* Commits will have the **correct author email** (`USER_EMAIL`)
* They will appear on the **USER_NAME/REPO_NAME** repository
* Obsidian commits will now “register” properly

---

_**Documentation maintained by: Raymond C. Turner**_

_*Date: February 26th, 2026*_

