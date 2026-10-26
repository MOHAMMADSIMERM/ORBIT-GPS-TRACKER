#!/usr/bin/env bash
# ==============================================================================
# ORBIT GPS — One-Click GitHub Push Script
# Usage: ./push_to_github.sh [https://github.com/YOUR_USERNAME/YOUR_REPO.git]
# ==============================================================================

set -e

echo "🛰️  ORBIT GPS Tracker — GitHub Deployment Script"
echo "================================================"

REPO_URL="$1"

if [ -z "$REPO_URL" ]; then
    echo ""
    echo "Please enter your GitHub repository URL:"
    echo "Example: https://github.com/simeer2007/ORBIT-GPS-Tracker.git"
    read -p "Repository URL: " REPO_URL
fi

if [ -z "$REPO_URL" ]; then
    echo "❌ Error: Repository URL cannot be empty."
    exit 1
fi

echo ""
echo "📦 Step 1: Checking Git status & adding files..."
git add .

echo "📝 Step 2: Committing all files (firmware, backend, web app, docs, and demo video)..."
git commit -m "feat: complete ORBIT GPS IoT tracker with ESP32 firmware, Flask backend, live tracking dashboard, and demo video" || echo "Working tree clean, proceeding..."

echo "🌿 Step 3: Setting main branch..."
git branch -M main

echo "🔗 Step 4: Configuring remote origin..."
if git remote | grep -q 'origin'; then
    git remote set-url origin "$REPO_URL"
else
    git remote add origin "$REPO_URL"
fi

echo "🚀 Step 5: Pushing to GitHub (origin/main)..."
git push -u origin main

echo ""
echo "================================================"
echo "✅ Successfully pushed to GitHub!"
echo "🔗 Repository: $REPO_URL"
echo "📹 Demo Video & GIF are located in docs/assets/ and embedded in README.md"
echo "================================================"
