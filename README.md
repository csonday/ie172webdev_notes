# Module 1c: CSS Notes
<!-- vscode-markdown-toc -->
* 1. [Preliminaries](#Preliminaries)
* 2. [Custom Style Sheets](#CustomStyleSheets)
* 3. [External Stylesheets](#ExternalStylesheets)
* 4. [Using CSS Classes](#UsingCSSClasses)
* 5. [Creating CSS Classes](#CreatingCSSClasses)
* 6. [Layouting](#Layouting)
	* 6.1. [Units of Measure](#UnitsofMeasure)
	* 6.2. [Margins and Padding](#MarginsandPadding)
	* 6.3. [Grid](#Grid)
	* 6.4. [Flex Boxes](#FlexBoxes)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

##  1. <a name='Preliminaries'></a>Preliminaries

1. Internet connection
2. Download and copy the assets folder inside `MyFirstApp`

##  2. <a name='CustomStyleSheets'></a>Custom Style Sheets

Cascading Style Sheets (CSS) are basically used to style HTML elements. In Dash, you can simply add CSS codes via the `style` argument. Try this by modifying your app.layout definition into the following:
```python
app.layout = html.Div(
    [
        html.Div(
            'Hello World',
            style={'border': '2px solid green'}
        )
    ]
)
```
* The `border` is known as a CSS property that you can alter to setup how an element looks like
* The other side of the pairing is known as the `value` for the property.


We will not be discussing all the possible CSS properties -- they are actually easily searchable on the internet according to your use cases.

##  3. <a name='ExternalStylesheets'></a>External Stylesheets
In the previous version of your application, you used a stylesheet that came with your import of `dbc`. To customize it, we setup the `assets` folder which contains `bootstrap.css` that you can modify to your liking.

In the `bootstrap.css` file, you can find the CSS properties for the HTML elements. when you scroll down, you can also find that some names are prefixed with a `.` -- these are called classes.

##  4. <a name='UsingCSSClasses'></a>Using CSS Classes

You can definitely use the classes in `bootstrap.css` into your work. Let's use `w-100` and `text-center` so we can put `Hello World` in the middle of the div. 

Put these two classes into the `className` argument of the div of interest. 

```python
        html.Div(
            'Hello World',
            style={'border': '2px solid green'},
            className='w-100 text-center'
        )
```

##  5. <a name='CreatingCSSClasses'></a>Creating CSS Classes
In programming, we do not like coding the same thing more than once. Custom CSS classes can be created for elements in your page that are repetitive. Something that I like to keep in my projects is:

```css
.placeholder-text{
    color: #777;
    font-style: italic;
    font-size: 90%;
}
```
As practice, these custom classes are placed not inside `bootstrap.css` so that we can better track these add-ons. Follow these instructions to setup your `customcss.css`.

1. Create `customcss.css` inside `assets`
2. Copy and paste the class definition above

Add 2 html.P() elements the `placeholder-text` class so your app looks like this now:

![placehold](./readme_img/placeholdertext.png0)


##  6. <a name='Layouting'></a>Layouting

###  6.1. <a name='UnitsofMeasure'></a>Units of Measure

###  6.2. <a name='MarginsandPadding'></a>Margins and Padding

###  6.3. <a name='Grid'></a>Grid

###  6.4. <a name='FlexBoxes'></a>Flex Boxes

