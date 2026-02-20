# Deployment Guide

## Overview

This guide covers deploying your Heart Disease Analysis Flask application to various hosting platforms.

## Deployment Options

### 1. Local Development (Already Configured)

**Pros:**
- Easy to test and modify
- No cost
- Full control

**Cons:**
- Only accessible on your machine
- Requires Python installation

**Setup:**
```bash
cd heart_disease_app
python app.py
# Access at http://localhost:5000
```

---

### 2. Heroku (Recommended for Beginners)

**Pros:**
- Free tier available
- Easy deployment
- Automatic HTTPS
- Good for demos

**Setup:**

1. **Install Heroku CLI**
   - Download from: https://devcenter.heroku.com/articles/heroku-cli

2. **Create Additional Files**

Create `Procfile`:
```
web: gunicorn app:app
```

Update `requirements.txt` to include:
```
gunicorn==20.1.0
```

Create `runtime.txt`:
```
python-3.11.0
```

3. **Deploy**
```bash
# Login to Heroku
heroku login

# Create new app
heroku create heart-disease-analysis

# Deploy
git init
git add .
git commit -m "Initial commit"
git push heroku main

# Open in browser
heroku open
```

---

### 3. PythonAnywhere

**Pros:**
- Free tier with custom domain
- Python-focused
- Easy Flask deployment
- No credit card required

**Setup:**

1. Sign up at https://www.pythonanywhere.com
2. Upload your files via Web interface or Git
3. Create a new Web App (Flask)
4. Configure WSGI file:

```python
import sys
path = '/home/yourusername/heart_disease_app'
if path not in sys.path:
    sys.path.append(path)

from app import app as application
```

5. Reload web app
6. Access at: `yourusername.pythonanywhere.com`

---

### 4. Google Cloud Platform (GCP)

**Pros:**
- Scalable
- Professional-grade
- Free tier available
- Global CDN

**Setup:**

1. **Create `app.yaml`**
```yaml
runtime: python39

handlers:
- url: /static
  static_dir: static

- url: /.*
  script: auto
```

2. **Deploy**
```bash
# Install Google Cloud SDK
# Initialize project
gcloud init

# Deploy
gcloud app deploy

# View
gcloud app browse
```

---

### 5. AWS Elastic Beanstalk

**Pros:**
- Highly scalable
- Auto-scaling
- Load balancing
- Enterprise-ready

**Setup:**

1. **Install EB CLI**
```bash
pip install awsebcli
```

2. **Initialize**
```bash
eb init -p python-3.9 heart-disease-app
```

3. **Create Environment**
```bash
eb create heart-disease-env
```

4. **Deploy**
```bash
eb deploy
```

5. **Open**
```bash
eb open
```

---

### 6. DigitalOcean App Platform

**Pros:**
- Simple deployment
- Predictable pricing
- Good documentation
- Managed databases

**Setup:**

1. Push code to GitHub
2. Connect DigitalOcean to your GitHub repo
3. Select Flask as framework
4. Configure build command: `pip install -r requirements.txt`
5. Configure run command: `gunicorn app:app`
6. Deploy

---

## Production Checklist

### Before Deployment

- [ ] Test all dashboards locally
- [ ] Verify all Tableau URLs are working
- [ ] Update `app.py` with correct Tableau embed URLs
- [ ] Test on different browsers (Chrome, Firefox, Safari)
- [ ] Test responsive design on mobile
- [ ] Check all internal links
- [ ] Verify external resources load (Google Fonts, etc.)
- [ ] Set `debug=False` in production
- [ ] Add error handling for missing dashboards

### Security

- [ ] Use environment variables for sensitive data
- [ ] Enable HTTPS (automatic on most platforms)
- [ ] Set appropriate CORS headers if needed
- [ ] Implement rate limiting if necessary
- [ ] Regular security updates for dependencies

### Performance

- [ ] Optimize images (if any added)
- [ ] Minify CSS/JS for production
- [ ] Enable caching headers
- [ ] Use CDN for static assets
- [ ] Monitor Tableau dashboard load times

### Monitoring

- [ ] Set up error logging
- [ ] Monitor application uptime
- [ ] Track page load times
- [ ] Set up analytics (optional)
- [ ] Configure alerts for downtime

---

## Environment Variables

For production, use environment variables for configuration:

**Create `.env` file (DO NOT commit this):**
```
FLASK_ENV=production
SECRET_KEY=your-secret-key-here
TABLEAU_SERVER=your-tableau-server.com
```

**Update `app.py`:**
```python
import os
from dotenv import load_dotenv

load_dotenv()

app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')
```

**Add to `requirements.txt`:**
```
python-dotenv==1.0.0
```

---

## Custom Domain Setup

### Heroku
```bash
heroku domains:add www.yourheartdiseaseapp.com
# Follow DNS configuration instructions
```

### PythonAnywhere
- Upgrade to paid plan
- Configure custom domain in Web tab

### GCP/AWS/DigitalOcean
- Follow platform-specific DNS instructions
- Usually involves adding CNAME or A records

---

## SSL/HTTPS

Most modern hosting platforms provide automatic HTTPS:
- **Heroku**: Automatic
- **PythonAnywhere**: Automatic
- **GCP**: Automatic with Cloud Load Balancer
- **AWS**: Use ACM (AWS Certificate Manager)
- **DigitalOcean**: Automatic with Let's Encrypt

---

## Maintenance

### Regular Updates
```bash
# Update dependencies
pip install --upgrade -r requirements.txt

# Test locally
python app.py

# Deploy updates
git push heroku main  # For Heroku
# or platform-specific deployment command
```

### Backup
- Backup Tableau workbooks regularly
- Version control all code with Git
- Export dashboard configurations

### Monitoring Tools
- **Heroku**: Built-in metrics
- **GCP**: Cloud Monitoring
- **AWS**: CloudWatch
- **Generic**: UptimeRobot, Pingdom

---

## Cost Estimates (as of 2026)

### Free Tiers
- **Heroku**: Free (with sleep after inactivity)
- **PythonAnywhere**: Free (with limitations)
- **GCP**: $300 credit for new users
- **AWS**: 12 months free tier

### Paid Options
- **Heroku**: $7/month (Hobby tier)
- **PythonAnywhere**: $5/month (Hacker plan)
- **DigitalOcean**: $5/month (Basic Droplet)
- **GCP/AWS**: Pay-as-you-go (varies)

---

## Troubleshooting Deployment

### Application Won't Start
- Check logs: `heroku logs --tail` (Heroku)
- Verify all dependencies in `requirements.txt`
- Check Python version compatibility
- Ensure `Procfile` is correct

### Static Files Not Loading
- Check static file paths in templates
- Verify static folder structure
- Configure static file serving for platform

### Tableau Dashboards Not Embedding
- Verify URLs are accessible publicly
- Check CORS settings on Tableau Server
- Ensure iframe embedding is allowed
- Test URL directly in browser

### Slow Performance
- Optimize Tableau dashboards
- Enable caching
- Upgrade hosting plan
- Use CDN for static assets

---

## Recommended Setup for Demo/Portfolio

**Best Choice: PythonAnywhere or Heroku**

1. Free to start
2. Easy deployment
3. Custom domain available
4. Professional appearance
5. Good uptime

**Quick Start:**
```bash
# For Heroku
heroku create your-app-name
git push heroku main
heroku open

# For PythonAnywhere
# Upload via web interface
# Configure in Web tab
```

---

## Production Configuration

**Update `app.py` for production:**

```python
import os

if __name__ == '__main__':
    # Development
    if os.environ.get('FLASK_ENV') == 'development':
        app.run(debug=True, host='0.0.0.0', port=5000)
    # Production
    else:
        app.run(debug=False, host='0.0.0.0', port=int(os.environ.get('PORT', 5000)))
```

---

## Next Steps

1. Choose a deployment platform
2. Follow platform-specific setup guide
3. Configure environment variables
4. Deploy application
5. Test all functionality
6. Configure custom domain (optional)
7. Set up monitoring
8. Share your deployed app!

---

## Support Resources

- **Heroku Docs**: https://devcenter.heroku.com/categories/python-support
- **PythonAnywhere Help**: https://help.pythonanywhere.com/
- **GCP Flask Tutorial**: https://cloud.google.com/appengine/docs/standard/python3/building-app
- **AWS EB Guide**: https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create-deploy-python-flask.html

**Your app is ready to deploy! Choose your platform and follow the guide above.**
