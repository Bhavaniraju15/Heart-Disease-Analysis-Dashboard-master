# Tableau Integration Guide

## How to Get Your Tableau Embed URLs

### Method 1: Tableau Public (Free)

1. **Create Your Dashboard in Tableau Desktop**
   - Open Tableau Desktop
   - Create your visualizations
   - Design your dashboard layout

2. **Publish to Tableau Public**
   - Go to Server → Tableau Public → Save to Tableau Public
   - Sign in to your Tableau Public account
   - Give your workbook a name
   - Click "Save"

3. **Get the Embed Code**
   - After publishing, your dashboard will open in a browser
   - Click the "Share" button at the bottom of the dashboard
   - Select the "Embed Code" tab
   - Copy the URL from the iframe src attribute
   - Example: `https://public.tableau.com/views/HeartDiseaseAnalysis/Dashboard1`

4. **Configure in Flask App**
   - Open `app.py`
   - Find the corresponding dashboard in the `DASHBOARDS` dictionary
   - Replace `YOUR_TABLEAU_URL_HERE_X` with your embed URL

### Method 2: Tableau Server (Enterprise)

1. **Publish to Tableau Server**
   - Open your workbook in Tableau Desktop
   - Go to Server → Publish Workbook
   - Select your Tableau Server
   - Choose project and set permissions
   - Click "Publish"

2. **Get the Embed URL**
   - Navigate to your dashboard on Tableau Server
   - Click the "Share" button
   - Select "Embed Code"
   - Copy the URL from the iframe
   - Example: `https://your-server.com/views/HeartDiseaseAnalysis/Dashboard1`

3. **Authentication Considerations**
   - If your Tableau Server requires authentication, you may need to:
     - Set appropriate permissions for guest access, OR
     - Implement Tableau's JavaScript API for trusted authentication

## Dashboard Configuration Template

```python
DASHBOARDS = {
    'dashboard_id': {
        'title': 'Dashboard Display Title',
        'description': 'Brief description of what this dashboard shows',
        'tableau_url': 'https://public.tableau.com/views/YourWorkbook/YourDashboard',
        'icon': '📊'  # Choose an appropriate emoji
    }
}
```

## Dashboard Creation Checklist

For each of your 10 dashboards, ensure:

### 1. Gender vs Heart Disease
- [ ] Bar chart showing heart disease distribution by gender
- [ ] Published to Tableau Public/Server
- [ ] URL added to `app.py`
- [ ] Test loading in browser

### 2. Age vs Heart Disease
- [ ] Bar/line chart showing disease prevalence by age group
- [ ] Published and URL configured
- [ ] Verified data accuracy

### 3. Diabetic vs Stroke
- [ ] Scatter plot or bubble chart
- [ ] Shows correlation between diabetes and stroke
- [ ] Published and embedded

### 4. Impact of Smoking and Alcohol
- [ ] Horizontal bar chart
- [ ] Compares smoking vs non-smoking and alcohol effects
- [ ] Configured in app

### 5. Other Heart Disease vs Stroke
- [ ] Bar chart showing different heart conditions
- [ ] Data properly filtered
- [ ] URL added

### 6. Race-wise Heart Disease
- [ ] Pie chart or bar chart by race/ethnicity
- [ ] All racial categories included
- [ ] Published successfully

### 7. General Health vs Heart Disease
- [ ] Bubble chart showing relationship
- [ ] Health categories clearly labeled
- [ ] Embedded correctly

### 8. Physical Activity vs Heart Disease
- [ ] Donut or pie chart
- [ ] Shows active vs sedentary populations
- [ ] Tested in app

### 9. Age vs BMI vs Diabetic
- [ ] Treemap or heatmap
- [ ] Multi-dimensional analysis visible
- [ ] URL configured

### 10. Comprehensive Dashboard
- [ ] Multiple visualizations combined
- [ ] All key metrics visible
- [ ] Fully responsive

## Best Practices

### Dashboard Design
- **Keep it Simple**: Focus on 1-3 key insights per dashboard
- **Use Color Wisely**: Maintain consistency with app color scheme
- **Add Tooltips**: Provide additional context on hover
- **Optimize Size**: Design for 1200px-1600px width
- **Test Responsiveness**: Ensure mobile compatibility

### Performance
- **Limit Data Points**: Use filters to reduce rendering time
- **Optimize Queries**: Use data extracts instead of live connections
- **Minimize Calculations**: Pre-calculate complex metrics
- **Use Aggregations**: Aggregate data at appropriate levels

### Accessibility
- **Color Contrast**: Ensure sufficient contrast for readability
- **Text Size**: Use readable font sizes (12px minimum)
- **Alt Text**: Add descriptions for screen readers
- **Keyboard Navigation**: Test tab navigation

## Tableau URL Formats

### Tableau Public
```
https://public.tableau.com/views/[WorkbookName]/[DashboardName]?:embed=y
```

### Tableau Server
```
https://[server-name]/views/[WorkbookName]/[DashboardName]?:embed=y
```

### Optional Parameters
Add these to your URL for customization:

- `?:embed=y` - Enables embed mode (removes Tableau navigation)
- `&:toolbar=no` - Hides the toolbar
- `&:tabs=no` - Hides worksheet tabs
- `&:showVizHome=no` - Hides Viz Home button
- `&:refresh=yes` - Auto-refresh data

**Example Full URL:**
```
https://public.tableau.com/views/HeartDisease/Dashboard1?:embed=y&:toolbar=no&:tabs=no
```

## Testing Your Integration

1. **Individual Dashboard Test**
   ```bash
   # Start Flask app
   python app.py
   
   # Navigate to specific dashboard
   http://localhost:5000/dashboard/gender_heart
   ```

2. **Check for Common Issues**
   - Dashboard not loading → Verify URL is correct and public
   - Broken layout → Check iframe dimensions in CSS
   - Slow loading → Optimize Tableau dashboard performance
   - Authentication errors → Verify server permissions

3. **Browser Console**
   - Open Developer Tools (F12)
   - Check Console for JavaScript errors
   - Verify iframe is loading correctly

## Troubleshooting

### Dashboard Shows "Dashboard Configuration Required"
**Cause**: Tableau URL is still set to placeholder value
**Solution**: Replace `YOUR_TABLEAU_URL_HERE_X` with actual URL

### Dashboard Loads but Shows Authentication Error
**Cause**: Tableau Server requires login
**Solution**: 
- Set dashboard to public access, OR
- Implement trusted authentication using Tableau JavaScript API

### Dashboard is Cropped or Not Fully Visible
**Cause**: Iframe dimensions too small
**Solution**: Adjust height in CSS:
```css
.tableau-embed {
    height: 1000px; /* Increase as needed */
}
```

### Dashboard Loads Very Slowly
**Cause**: Too much data or complex calculations
**Solution**:
- Use data extracts instead of live connections
- Add filters to limit data
- Simplify calculations
- Reduce number of visualizations

## Advanced: JavaScript API Integration

For more control, use Tableau's JavaScript API:

```javascript
<script src="https://public.tableau.com/javascripts/api/tableau-2.min.js"></script>

<script>
    var containerDiv = document.getElementById("vizContainer");
    var url = "https://public.tableau.com/views/HeartDisease/Dashboard1";
    
    var options = {
        width: "100%",
        height: "850px",
        hideTabs: true,
        hideToolbar: true,
        onFirstInteractive: function() {
            console.log("Dashboard loaded!");
        }
    };
    
    var viz = new tableau.Viz(containerDiv, url, options);
</script>
```

## Support Resources

- **Tableau Help**: https://help.tableau.com
- **Tableau Community**: https://community.tableau.com
- **Embed API Docs**: https://help.tableau.com/current/api/embedding_api/en-us/
- **Flask Documentation**: https://flask.palletsprojects.com

---

**Next Steps:**
1. Create all 10 dashboards in Tableau
2. Publish to Tableau Public or Server
3. Copy embed URLs
4. Update `app.py` with actual URLs
5. Test each dashboard in the Flask app
6. Deploy your application!
