# Heart Disease Analysis - Flask Web Application

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![Flask](https://img.shields.io/badge/Flask-2.3.0-green.svg)
![Tableau](https://img.shields.io/badge/Tableau-2023+-orange.svg)
![License](https://img.shields.io/badge/License-Educational-yellow.svg)

A comprehensive web application for visualizing and analyzing heart disease data using Tableau dashboards embedded in a Flask application.

## 🎯 Project Overview

This project leverages the power of Tableau for data visualization and Flask for web delivery to create an interactive platform for exploring heart disease risk factors. With 4,500+ patient records and 18 health indicators, the platform provides evidence-based insights for healthcare professionals, researchers, and policymakers.

## ✨ Features

- **10+ Interactive Dashboards**: Comprehensive visualizations covering various aspects of heart disease
- **Responsive Design**: Works seamlessly across desktop, tablet, and mobile devices
- **Beautiful UI**: Medical-themed professional design with smooth animations
- **Easy Navigation**: Intuitive interface with breadcrumb navigation and dashboard linking
- **Real-time Insights**: Interactive Tableau visualizations embedded directly in the web app
- **Educational Content**: Detailed information about heart disease risk factors

## 📊 Available Dashboards

1. **Gender vs Heart Disease**: Analysis of heart disease distribution across gender
2. **Age vs Heart Disease**: Heart disease patterns across different age groups
3. **Diabetic vs Stroke**: Correlation between diabetes and stroke occurrence
4. **Impact of Smoking and Alcohol**: Effects on heart disease
5. **Other Heart Disease vs Stroke**: Analysis of various heart conditions
6. **Race-wise Heart Disease**: Distribution across racial groups
7. **General Health vs Heart Disease**: Correlation analysis
8. **Physical Activity vs Heart Disease**: Impact of physical activity
9. **Age vs BMI vs Diabetic**: Multi-factor analysis
10. **Comprehensive Dashboard**: Complete overview of all factors

## 🗂️ Project Structure

```
heart_disease_app/
├── app.py                      # Main Flask application
├── static/
│   ├── css/
│   │   └── style.css          # Main stylesheet
│   ├── js/
│   │   └── main.js            # JavaScript functionality
│   └── images/                # Image assets
├── templates/
│   ├── base.html              # Base template
│   ├── index.html             # Landing page
│   ├── dashboard.html         # Dashboard viewer
│   └── about.html             # About page
├── README.md                   # This file
└── requirements.txt           # Python dependencies
```

## 🚀 Installation & Setup

### Prerequisites

- Python 3.8 or higher
- pip (Python package manager)
- Tableau Public or Tableau Server account (for publishing dashboards)

### Step 1: Clone or Download

Download the project files to your local machine.

### Step 2: Install Dependencies

```bash
cd heart_disease_app
pip install -r requirements.txt
```

### Step 3: Configure Tableau URLs

1. Publish your Tableau dashboards to Tableau Public or Tableau Server
2. Copy the embed URLs for each dashboard
3. Open `app.py` and locate the `DASHBOARDS` dictionary
4. Replace the placeholder URLs with your actual Tableau embed URLs:

```python
DASHBOARDS = {
    'gender_heart': {
        'title': 'Gender vs Heart Disease',
        'description': 'Analysis of heart disease distribution across gender',
        'tableau_url': 'https://public.tableau.com/views/YourDashboard1/Dashboard',
        'icon': '👥'
    },
    # ... update all dashboard URLs
}
```

### Step 4: Run the Application

```bash
python app.py
```

The application will start on `http://localhost:5000`

## 🎨 Customization

### Changing Colors

Edit the CSS variables in `static/css/style.css`:

```css
:root {
    --primary-color: #2563eb;
    --secondary-color: #0891b2;
    --accent-color: #ec4899;
    /* ... other variables */
}
```

### Adding New Dashboards

1. Add a new entry to the `DASHBOARDS` dictionary in `app.py`:

```python
'new_dashboard': {
    'title': 'Your Dashboard Title',
    'description': 'Description of your dashboard',
    'tableau_url': 'YOUR_TABLEAU_URL',
    'icon': '📊'
}
```

2. The dashboard will automatically appear in the gallery and navigation

### Modifying Content

- **Landing Page**: Edit `templates/index.html`
- **About Page**: Edit `templates/about.html`
- **Styles**: Edit `static/css/style.css`
- **JavaScript**: Edit `static/js/main.js`

## 📈 Dataset Information

- **Total Records**: 4,500 patient records
- **Variables**: 18 health indicators
- **Key Metrics**:
  - Heart Disease Status
  - BMI, Age, Gender, Race
  - Lifestyle factors (Smoking, Alcohol, Physical Activity)
  - Comorbidities (Diabetes, Stroke, Kidney Disease, Asthma)
  - Health metrics (Sleep, Mental Health, Physical Health)

## 🛠️ Technology Stack

- **Backend**: Flask (Python)
- **Frontend**: HTML5, CSS3, JavaScript
- **Visualization**: Tableau
- **Fonts**: Google Fonts (Poppins, Source Serif 4)
- **Icons**: Unicode Emojis

## 📱 Responsive Design

The application is fully responsive and optimized for:
- Desktop (1920px+)
- Laptop (1366px - 1920px)
- Tablet (768px - 1366px)
- Mobile (320px - 768px)

## 🔧 Development

### Project Structure Details

**app.py**: Main Flask application file
- Route definitions
- Dashboard configuration
- API endpoints

**static/css/style.css**: Comprehensive stylesheet
- CSS custom properties for theming
- Responsive grid layouts
- Animations and transitions
- Medical-themed color palette

**static/js/main.js**: Interactive features
- Scroll effects
- Dashboard filtering
- Animations
- Mobile menu

**templates/**: Jinja2 HTML templates
- Base template with header/footer
- Page-specific templates
- Reusable components

## 🎯 Use Cases

### Healthcare Professionals
Analyze patient data, identify risk factors, and develop targeted intervention strategies

### Policymakers
Study trends across demographics to inform public health policies and resource allocation

### Researchers
Explore correlations and patterns in cardiovascular health data

### Patients
Understand personal health risks and receive guidance on lifestyle modifications

## 📝 Best Practices

1. **Tableau Embed URLs**: Always use HTTPS URLs for secure embedding
2. **Performance**: Optimize dashboard complexity for faster loading
3. **Accessibility**: Maintain color contrast ratios for readability
4. **Data Privacy**: Ensure compliance with healthcare data regulations
5. **Browser Support**: Test across Chrome, Firefox, Safari, and Edge

## 🐛 Troubleshooting

**Dashboard Not Loading?**
- Check that the Tableau URL is correct and publicly accessible
- Verify that the dashboard is published and not set to private
- Check browser console for error messages

**Styling Issues?**
- Clear browser cache
- Check that CSS file is loading correctly
- Verify path to static files

**Port Already in Use?**
- Change port in `app.py`: `app.run(port=5001)`

## 📄 License

This project is for educational and research purposes. Please ensure compliance with relevant data privacy regulations when using patient health data.

## 🤝 Contributing

Contributions are welcome! Please feel free to:
- Report bugs
- Suggest new features
- Improve documentation
- Submit pull requests

## 📧 Contact

For questions or support, please refer to the project documentation or contact the development team.

## 🙏 Acknowledgments

- Dataset providers
- Tableau for visualization capabilities
- Flask framework developers
- Open source community

---

**Built with ❤️ for better cardiovascular health outcomes**
