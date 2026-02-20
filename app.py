from flask import Flask, render_template, jsonify
import json

app = Flask(__name__)

# Dashboard configuration - Your Tableau dashboards are configured below
DASHBOARDS = {
    'gender_heart': {
        'title': 'Gender vs Heart Disease',
        'description': 'Analysis of heart disease distribution across gender',
        'tableau_url': 'https://public.tableau.com/views/heart_disease_analysis_17709056947700/Sheet1?:embed=y&:display_count=yes',
        'icon': '👥'
    },
    'age_heart': {
        'title': 'Age vs Heart Disease',
        'description': 'Heart disease patterns across different age groups',
        'tableau_url': 'https://public.tableau.com/views/heart_disease_analysis_17709056947700/Sheet2?:embed=y&:display_count=yes',
        'icon': '📊'
    },
    'diabetic_stroke': {
        'title': 'Diabetic vs Stroke',
        'description': 'Correlation between diabetes and stroke occurrence',
        'tableau_url': 'https://public.tableau.com/views/heart_disease_analysis_17709056947700/Sheet3?:embed=y&:display_count=yes',
        'icon': '🩺'
    },
    'smoking_alcohol': {
        'title': 'Impact of Smoking and Alcohol',
        'description': 'Effects of smoking and alcohol on heart disease',
        'tableau_url': 'https://public.tableau.com/views/heart_disease_analysis_17709056947700/Sheet4?:embed=y&:display_count=yes',
        'icon': '🚭'
    },
    'other_diseases': {
        'title': 'Other Heart Disease vs Stroke',
        'description': 'Analysis of various heart conditions and stroke',
        'tableau_url': 'https://public.tableau.com/views/heart_disease_analysis_17709056947700/Sheet5?:embed=y&:display_count=yes',
        'icon': '❤️'
    },
    'race_analysis': {
        'title': 'Race-wise Heart Disease',
        'description': 'Heart disease distribution across racial groups',
        'tableau_url': 'https://public.tableau.com/views/heart_disease_analysis_17709056947700/Sheet6?:embed=y&:display_count=yes',
        'icon': '🌍'
    },
    'general_health': {
        'title': 'General Health vs Heart Disease',
        'description': 'Correlation between general health and heart disease',
        'tableau_url': 'https://public.tableau.com/views/heart_disease_analysis_17709056947700/Sheet7?:embed=y&:display_count=yes',
        'icon': '💪'
    },
    'physical_activity': {
        'title': 'Physical Activity vs Heart Disease',
        'description': 'Impact of physical activity on heart disease risk',
        'tableau_url': 'https://public.tableau.com/views/heart_disease_analysis_17709056947700/Sheet8?:embed=y&:display_count=yes',
        'icon': '🏃'
    },
    'age_bmi_diabetic': {
        'title': 'Age vs BMI vs Diabetic',
        'description': 'Multi-factor analysis of age, BMI, and diabetes',
        'tableau_url': 'https://public.tableau.com/views/heart_disease_analysis_17709056947700/Sheet9?:embed=y&:display_count=yes',
        'icon': '📈'
    },
    'comprehensive': {
        'title': 'Comprehensive Dashboard',
        'description': 'Complete overview of all heart disease factors',
        'tableau_url': 'https://public.tableau.com/views/heart_disease_analysis_17709056947700/Dashboard1?:embed=y&:display_count=yes',
        'icon': '📋'
    }
}

@app.route('/')
def index():
    """Landing page"""
    return render_template('index.html', dashboards=DASHBOARDS)

@app.route('/dashboard/<dashboard_id>')
def dashboard(dashboard_id):
    """Individual dashboard view"""
    if dashboard_id in DASHBOARDS:
        return render_template('dashboard.html', 
                             dashboard=DASHBOARDS[dashboard_id],
                             dashboard_id=dashboard_id,
                             all_dashboards=DASHBOARDS)
    return "Dashboard not found", 404

@app.route('/about')
def about():
    """About page"""
    return render_template('about.html')

@app.route('/api/dashboards')
def api_dashboards():
    """API endpoint for dashboard data"""
    return jsonify(DASHBOARDS)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
