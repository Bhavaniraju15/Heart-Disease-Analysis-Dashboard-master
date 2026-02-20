# Heart Disease Analysis - Complete Project Documentation

## Table of Contents
1. [Project Overview](#project-overview)
2. [Getting Started](#getting-started)
3. [File Structure](#file-structure)
4. [Configuration](#configuration)
5. [Features](#features)
6. [Customization](#customization)
7. [Deployment](#deployment)
8. [FAQ](#faq)

---

## Project Overview

### What is This Project?

This is a complete Flask web application designed to showcase your Heart Disease Analysis Tableau dashboards in a professional, interactive web interface. The application provides:

- **Beautiful UI**: Medical-themed professional design with smooth animations
- **10 Dashboard Pages**: Each Tableau visualization gets its own dedicated page
- **Responsive Design**: Works perfectly on desktop, tablet, and mobile
- **Easy Navigation**: Intuitive menus and breadcrumb trails
- **Landing Page**: Engaging homepage with project overview
- **About Page**: Detailed information about your analysis

### Technologies Used

- **Backend**: Flask (Python web framework)
- **Frontend**: HTML5, CSS3, JavaScript
- **Visualization**: Tableau (embedded dashboards)
- **Fonts**: Google Fonts (Poppins, Source Serif 4)
- **Design**: Custom CSS with medical theme

---

## Getting Started

### Prerequisites

Before you start, make sure you have:
- Python 3.8 or higher installed
- Your Tableau dashboards published (Tableau Public or Tableau Server)
- Text editor (VS Code, Sublime, Notepad++, etc.)
- Web browser (Chrome, Firefox, Safari, Edge)

### Quick Start (3 Steps)

#### Step 1: Extract Files
Extract the `heart_disease_app` folder to your desired location.

#### Step 2: Configure Tableau URLs
1. Open `app.py` in your text editor
2. Find the `DASHBOARDS` dictionary (around line 7)
3. Replace each `YOUR_TABLEAU_URL_HERE_X` with your actual Tableau embed URL
4. Save the file

**Example:**
```python
'gender_heart': {
    'title': 'Gender vs Heart Disease',
    'description': 'Analysis of heart disease distribution across gender',
    'tableau_url': 'https://public.tableau.com/views/HeartDisease/GenderDashboard',
    'icon': '👥'
}
```

#### Step 3: Run the App

**Windows:**
- Double-click `start.bat`
- The app will open in your browser automatically

**Mac/Linux:**
```bash
chmod +x start.sh
./start.sh
```

**Manual Start:**
```bash
# Create virtual environment
python -m venv venv

# Activate it
# Windows: venv\Scripts\activate
# Mac/Linux: source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the app
python app.py
```

The application will be available at: **http://localhost:5000**

---

## File Structure

```
heart_disease_app/
│
├── app.py                      # Main Flask application
│   └── Contains routes and dashboard configuration
│
├── templates/                  # HTML templates
│   ├── base.html              # Base template (header, footer)
│   ├── index.html             # Landing page
│   ├── dashboard.html         # Dashboard viewer page
│   └── about.html             # About page
│
├── static/                     # Static assets
│   ├── css/
│   │   └── style.css          # Main stylesheet (all styling)
│   ├── js/
│   │   └── main.js            # JavaScript functionality
│   └── images/                # Image folder (add your images here)
│
├── requirements.txt            # Python dependencies
├── README.md                   # Main documentation
├── TABLEAU_SETUP.md           # Tableau integration guide
├── DEPLOYMENT.md              # Deployment instructions
├── start.sh                   # Quick start script (Mac/Linux)
└── start.bat                  # Quick start script (Windows)
```

### Key Files Explained

**app.py**
- Main application file
- Defines routes (URLs)
- Contains dashboard configuration
- Edit this to add/modify dashboards

**templates/base.html**
- Header and footer for all pages
- Navigation menu
- Consistent layout across site

**templates/index.html**
- Landing page
- Dashboard gallery
- Key insights section

**templates/dashboard.html**
- Displays individual Tableau dashboards
- Navigation between dashboards
- Related dashboards section

**static/css/style.css**
- All styling and design
- Color scheme
- Responsive layouts
- Animations

**static/js/main.js**
- Interactive features
- Scroll effects
- Mobile menu
- Animations

---

## Configuration

### Configuring Tableau Dashboards

The most important configuration is setting up your Tableau dashboard URLs.

**1. Open `app.py`**

**2. Find the DASHBOARDS dictionary:**
```python
DASHBOARDS = {
    'gender_heart': {
        'title': 'Gender vs Heart Disease',
        'description': 'Analysis of heart disease distribution across gender',
        'tableau_url': 'YOUR_TABLEAU_URL_HERE_1',
        'icon': '👥'
    },
    # ... more dashboards
}
```

**3. Replace URLs:**
Get your Tableau embed URL and replace the placeholder:

From:
```python
'tableau_url': 'YOUR_TABLEAU_URL_HERE_1'
```

To:
```python
'tableau_url': 'https://public.tableau.com/views/YourWorkbook/Dashboard1'
```

**4. Repeat for all 10 dashboards**

### Getting Tableau Embed URLs

#### Tableau Public:
1. Publish dashboard to Tableau Public
2. Click "Share" button
3. Select "Embed Code" tab
4. Copy URL from `<iframe src="...">`

#### Tableau Server:
1. Open dashboard on server
2. Click "Share"
3. Copy embed URL
4. Ensure dashboard is set to public or configure authentication

### Customizing Dashboard Metadata

For each dashboard, you can customize:

```python
'dashboard_id': {
    'title': 'Your Dashboard Title',           # Shown on page
    'description': 'What this dashboard shows',  # Brief description
    'tableau_url': 'https://...',               # Embed URL
    'icon': '📊'                                # Emoji icon (optional)
}
```

**Available Dashboard IDs:**
1. `gender_heart`
2. `age_heart`
3. `diabetic_stroke`
4. `smoking_alcohol`
5. `other_diseases`
6. `race_analysis`
7. `general_health`
8. `physical_activity`
9. `age_bmi_diabetic`
10. `comprehensive`

---

## Features

### 1. Landing Page
- Hero section with project overview
- Statistics cards (animated counters)
- Dashboard gallery with cards
- Key insights section
- Call-to-action

### 2. Dashboard Viewer
- Full-screen Tableau embed
- Breadcrumb navigation
- Previous/Next dashboard navigation
- Related dashboards section
- Placeholder when URL not configured

### 3. About Page
- Project overview
- Real-world scenarios
- Dataset information
- Technology stack
- Project objectives

### 4. Responsive Design
- Mobile-friendly navigation
- Tablet-optimized layouts
- Desktop full experience
- Touch-friendly interface

### 5. Interactive Elements
- Smooth scroll animations
- Hover effects on cards
- Animated statistics
- Mobile menu toggle
- Loading indicators

---

## Customization

### Changing Colors

**Edit `static/css/style.css`:**

```css
:root {
    /* Primary colors */
    --primary-color: #2563eb;      /* Main blue */
    --secondary-color: #0891b2;    /* Cyan */
    --accent-color: #ec4899;       /* Pink */
    
    /* Status colors */
    --success-color: #10b981;      /* Green */
    --warning-color: #f59e0b;      /* Orange */
    --danger-color: #ef4444;       /* Red */
    
    /* Backgrounds */
    --bg-primary: #ffffff;         /* White */
    --bg-secondary: #f8fafc;       /* Light gray */
}
```

### Changing Fonts

**In `style.css`, update the import:**
```css
@import url('https://fonts.googleapis.com/css2?family=YourFont:wght@400;700&display=swap');

body {
    font-family: 'YourFont', sans-serif;
}
```

### Adding New Pages

**1. Create template:**
Create `templates/new_page.html`:
```html
{% extends "base.html" %}

{% block title %}New Page{% endblock %}

{% block content %}
<h1>Your Content Here</h1>
{% endblock %}
```

**2. Add route in `app.py`:**
```python
@app.route('/new-page')
def new_page():
    return render_template('new_page.html')
```

**3. Add to navigation:**
Edit `templates/base.html`:
```html
<li><a href="/new-page">New Page</a></li>
```

### Modifying Content

**Landing Page Text:**
- Edit `templates/index.html`
- Update hero text, descriptions, insights

**About Page:**
- Edit `templates/about.html`
- Modify scenarios, objectives, etc.

**Footer:**
- Edit `templates/base.html`
- Update footer sections

---

## Deployment

### Local Testing
```bash
python app.py
# Visit http://localhost:5000
```

### Production Deployment

See `DEPLOYMENT.md` for detailed instructions on deploying to:
- Heroku (Recommended for beginners)
- PythonAnywhere
- Google Cloud Platform
- AWS Elastic Beanstalk
- DigitalOcean

**Quick Heroku Deployment:**
```bash
# Install Heroku CLI
# Login
heroku login

# Create app
heroku create your-app-name

# Deploy
git init
git add .
git commit -m "Initial commit"
git push heroku main

# Open
heroku open
```

---

## FAQ

### Q: Dashboard shows "Configuration Required" message?
**A:** You need to replace the placeholder Tableau URLs in `app.py` with your actual dashboard URLs.

### Q: Dashboard loads slowly?
**A:** This is usually due to Tableau dashboard performance. Optimize your dashboards by:
- Using data extracts instead of live connections
- Adding filters to reduce data
- Simplifying calculations

### Q: How do I add more dashboards?
**A:** Add a new entry to the `DASHBOARDS` dictionary in `app.py`:
```python
'new_dashboard': {
    'title': 'New Dashboard',
    'description': 'Description',
    'tableau_url': 'https://...',
    'icon': '📊'
}
```

### Q: Can I change the color scheme?
**A:** Yes! Edit the CSS custom properties in `static/css/style.css`.

### Q: Dashboard not embedding?
**A:** Check:
1. URL is correct and publicly accessible
2. Tableau dashboard allows embedding
3. CORS settings permit embedding
4. Try URL directly in browser

### Q: How do I update to production mode?
**A:** In `app.py`, change:
```python
app.run(debug=False)
```

### Q: Can I add Google Analytics?
**A:** Yes! Add tracking code to `templates/base.html` before `</head>`:
```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=YOUR-ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'YOUR-ID');
</script>
```

---

## Troubleshooting

### Port Already in Use
**Error:** Address already in use
**Solution:** Change port in `app.py`:
```python
app.run(port=5001)
```

### Module Not Found
**Error:** No module named 'flask'
**Solution:** Install dependencies:
```bash
pip install -r requirements.txt
```

### Tableau Dashboard Not Loading
**Solutions:**
1. Check URL is correct
2. Verify dashboard is public
3. Test URL in new browser tab
4. Check browser console for errors
5. Ensure iframe embedding is allowed

### CSS Not Loading
**Solutions:**
1. Clear browser cache (Ctrl+F5)
2. Check file path in template
3. Verify static folder structure
4. Check for CSS syntax errors

---

## Support & Resources

### Documentation Files
- `README.md` - Overview and quick start
- `TABLEAU_SETUP.md` - Tableau integration guide
- `DEPLOYMENT.md` - Deployment instructions
- This file - Complete documentation

### External Resources
- Flask Documentation: https://flask.palletsprojects.com
- Tableau Help: https://help.tableau.com
- Python Documentation: https://docs.python.org

### Getting Help
1. Check this documentation
2. Review error messages in console
3. Check browser developer tools (F12)
4. Verify all files are present
5. Test with simple HTML first

---

## Next Steps

1. ✅ Extract and review files
2. ✅ Configure Tableau URLs
3. ✅ Run application locally
4. ✅ Test all dashboards
5. ✅ Customize colors/content (optional)
6. ✅ Deploy to web (optional)
7. ✅ Share your analysis!

---

**Congratulations! Your Heart Disease Analysis web application is ready to use.**

For questions or issues, refer to the troubleshooting section or review the detailed documentation in the other .md files.

**Happy analyzing! 📊❤️**
