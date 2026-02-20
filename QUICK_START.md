# 🚀 QUICK START - Heart Disease Analysis Flask App

## ⚡ 3-Minute Setup

### Step 1: Configure Tableau URLs (REQUIRED)
Open `app.py` and replace these placeholders with your Tableau dashboard URLs:

```python
DASHBOARDS = {
    'gender_heart': {
        ...
        'tableau_url': 'YOUR_TABLEAU_URL_HERE_1',  # ← Replace this
    },
```

**Where to get Tableau URLs:**
- Tableau Public: Share → Embed Code → Copy URL from iframe
- Tableau Server: Share → Copy embed URL

### Step 2: Run the App

**Windows Users:**
1. Double-click `start.bat`
2. App opens automatically in browser

**Mac/Linux Users:**
```bash
./start.sh
```

**Manual Method:**
```bash
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
python app.py
```

### Step 3: Visit in Browser
Open: **http://localhost:5000**

---

## 📁 What You Got

```
heart_disease_app/
├── app.py                  # ← Configure your Tableau URLs here
├── templates/              # HTML pages
├── static/                 # CSS, JS, images
├── start.bat              # Windows quick start
├── start.sh               # Mac/Linux quick start
├── requirements.txt       # Python dependencies
└── Documentation files    # Guides (READ ME files)
```

---

## 🎨 Quick Customizations

### Change Colors
Edit `static/css/style.css`, line 4-10:
```css
:root {
    --primary-color: #2563eb;    /* Main blue */
    --secondary-color: #0891b2;  /* Cyan */
    --accent-color: #ec4899;     /* Pink */
}
```

### Edit Landing Page
Open `templates/index.html` and modify text

### Change Footer
Edit `templates/base.html` footer section

---

## 📊 10 Dashboard Pages

Your app includes pages for:
1. Gender vs Heart Disease
2. Age vs Heart Disease  
3. Diabetic vs Stroke
4. Impact of Smoking & Alcohol
5. Other Heart Disease vs Stroke
6. Race-wise Heart Disease
7. General Health vs Heart Disease
8. Physical Activity vs Heart Disease
9. Age vs BMI vs Diabetic
10. Comprehensive Dashboard

Each gets a beautiful dedicated page!

---

## 🌐 Deploy to Web (Optional)

### Easiest: Heroku (Free)
```bash
heroku create your-app-name
git push heroku main
```

### Alternatives:
- PythonAnywhere (Free tier)
- Google Cloud Platform
- AWS Elastic Beanstalk
- DigitalOcean

See `DEPLOYMENT.md` for detailed instructions.

---

## 🆘 Common Issues

**"Dashboard Configuration Required" message?**
→ You need to add your Tableau URLs to `app.py`

**Port 5000 already in use?**
→ Change port in `app.py`: `app.run(port=5001)`

**Dashboard not loading?**
→ Check URL is public and allows embedding

**CSS not working?**
→ Clear browser cache (Ctrl+F5)

---

## 📚 Documentation Files

- `COMPLETE_GUIDE.md` - Full documentation
- `TABLEAU_SETUP.md` - How to get embed URLs
- `DEPLOYMENT.md` - Deploy to web
- `README.md` - Project overview

---

## ✅ Checklist

- [ ] Python 3.8+ installed
- [ ] Extracted all files
- [ ] Configured Tableau URLs in `app.py`
- [ ] Ran `start.bat` or `start.sh`
- [ ] Tested at http://localhost:5000
- [ ] All 10 dashboards loading
- [ ] Ready to deploy (optional)

---

## 🎯 What This App Does

✨ **Professional Web Interface** for your Tableau dashboards
📱 **Responsive Design** - works on all devices
🎨 **Beautiful Medical Theme** with smooth animations
🧭 **Easy Navigation** between dashboards
📊 **10 Dashboard Pages** + Landing + About pages
🚀 **Ready to Deploy** to web hosting

---

## 💡 Tips

1. **Test Locally First** - Make sure everything works before deploying
2. **Optimize Dashboards** - Faster Tableau dashboards = faster web app
3. **Customize Colors** - Match your brand/preference
4. **Add Analytics** - Track visitors with Google Analytics
5. **Use HTTPS** - Most hosting platforms provide this automatically

---

## 🎉 You're Ready!

Your professional Heart Disease Analysis web application is ready to showcase your data visualization work.

**Need Help?** Check the documentation files or review the FAQ in `COMPLETE_GUIDE.md`

**Have Fun!** 📊❤️

---

**Quick Commands:**

Start app: `python app.py`
Stop app: `Ctrl+C`
Install deps: `pip install -r requirements.txt`
Check Python: `python --version`

Visit: **http://localhost:5000**
