# 🤠 Chuck Norris Daily Roundhouse & Blessings Web App

A Ruby on Rails web application delivering Chuck Norris facts, iconic movie meme scenes with authentic photography, and daily email blessings wishing users an invincible day.

---

## 🚀 Features

- **Chuck Norris Jokes & Facts**: Curated collection with interactive "Respect" (like) button and category filtering.
- **Roundhouse Randomizer**: Instant AJAX/JSON joke generator for non-stop roundhouse wisdom.
- **Real Photo Gallery**: Authentic movie stills and photos from *The Delta Force*, *Walker, Texas Ranger*, *The Way of the Dragon*, *Missing in Action*, *Lone Wolf McQuade*, and *The Expendables 2*.
- **Interactive Daily Blessing Generator**: Enter your name and pick a warrior tone (*Mighty Texas Ranger*, *Delta Force Thunder*, *Dragon Fist Master*, *Cosmic Overlord*) to receive a personal blessing.
- **Daily Email Subscription**: Subscriber model with `ChuckMailer` welcome email, daily blessings, web email preview (`/subscribers/preview_email`), and automated rake task (`bin/rails chuck:deliver_daily_blessings`).
- **PostgreSQL in Production**: Configured for PostgreSQL in production (`pg` gem, `database.yml` parsing `DATABASE_URL` / `DB_*` vars) and SQLite for local development & testing.

---

## ⚙️ GitHub Actions Automatic Build Setup (`:latest`)

An automated workflow is configured in `.github/workflows/docker-build.yml`.

### How it Works:
1. **Trigger**: Automatically runs on every `push` to the **`master`** branch (or manually via **Workflow Dispatch** under GitHub Actions tab).
2. **Registry**: Pushes the image to **GitHub Container Registry (`ghcr.io`)** at:
   `ghcr.io/mcleod190/chuck-app:latest`
3. **Authentication**: Uses `secrets.GITHUB_TOKEN` provided automatically by GitHub Actions.

### To push your code to GitHub:
```bash
git push -u origin master
```

Once pushed, navigate to `https://github.com/mcleod190/chuck-app/actions` to see the automated build in real time!

---

## 🛠️ Local Setup & Commands

### 1. Install Dependencies & Setup Database
```bash
bundle install
bin/rails db:prepare
bin/rails db:seed
```

### 2. Run Test Suite
```bash
bin/rails test
```

### 3. Start Local Web Server
```bash
bin/rails server
```
- Web Application: `http://localhost:3000`
- Live Email Preview: `http://localhost:3000/subscribers/preview_email`

### 4. Deliver Daily Emails (Rake Task)
```bash
bin/rails chuck:deliver_daily_blessings
```

