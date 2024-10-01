## Preliminaries

For this module, we will be creating a multi-page application. Take note of the following aspects of the source code:
* File Organization -- how we arrange the files needed for the application
* Code Organization -- where scripts are stored and how they are accessed
* Code Management -- how we work with scripts and where we put them
* Callback structures and syntax 

### Requirements
For this module, you will need the following:
* Your workspaces with venv configured
* A new folder to store the new app -- will be referred to as `app_folder`. 
* An `assets` folder within the main folder for the app.
* The directories will look like the following: Please add the files needed.
```
app_folder
    |-assets
    |   |-bootstrap.py
    |-apps
    |   |-home.py
    |   |-commonmodules.py
    |-app.py
    |-index.py
```

### Review

The following scripts below show a breakdown of `app.py` from the previous module.

![appoutline](./readme_img/appoutline.png)

In this module, we will breakdown the contents of this `app.py`into multiple files. 

## Create `app.py`

**What is this file for?** Your `app.py` creates the `app` variable and setups the application's desired configurations.

On your blank `app.py`, add the following scripts.

```python
import logging

import dash
import dash_bootstrap_components as dbc
from dash import dcc, html

# Create the application object (stored in app variable), along with CSS stylesheets
app = dash.Dash(__name__)

# Make sure that callbacks are not activated when input elements enter the layout
app.config.suppress_callback_exceptions = True

# Get CSS from a local folder
app.css.config.serve_locally = True

# Enables your app to run offline
app.scripts.config.serve_locally = True

# Set app title that appears in your browser tab
app.title = 'IE 172 Sample IS'

# These 2 lines reduce the logs on your terminal so you could debug better
# when you encounter errors in app
log = logging.getLogger('werkzeug')
log.setLevel(logging.ERROR)
```

## Create `index.py`


**What is this file for?** This is the *control center* of your application. This file has the following characteristics. 
* Contains `app.layout` -- the variable that sets the layout of the application
* This file decides which content shows up in `app.layout`

We start the contents of `index.py` with the following scripts. 

```python
import webbrowser

import dash
import dash_bootstrap_components as dbc
from dash import dcc, html
from dash.dependencies import Input, Output, State
from dash.exceptions import PreventUpdate

# Importing your app variable from app.py so we can use it
from app import app

app.layout = html.Div(
    [
        # Location Variable -- contains details about the url
        dcc.Location(id='url', refresh=True),

        # Page Content -- Div that contains page layout
        html.Div(id='page_content', className='m-2 p-2'),
    ]
)

```

## Switching `page-content` using URL
Now, we introduce a callback that does the following action statement:
> If the `url` changes, `page_content` must be updated based on the expected content.

```python
@app.callback(
    [
        Output('page_content', 'children')
    ],
    [
        Input('url', 'pathname')
    ]
)
def displaypage (pathname):
    
    # This code block extracts the id of the triggered input
    ctx = dash.callback_context
    if ctx.triggered:
        eventid = ctx.triggered[0]['prop_id'].split('.')[0]   
    else:
        raise PreventUpdate

        
    # This code block executes action based on the value of eventid
    if eventid == 'url':
        if pathname == '/' or pathname == '/home':
            returnlayout = "home"

        elif pathname == '/movies':
            returnlayout = 'moviepage'

        else:
            returnlayout = 'error404'
    
    else: 
        raise PreventUpdate
    
    return [returnlayout]
    
```

## Add scripts to run the server
Do not forget to add a command to run your server. 

```python
if __name__ == '__main__':
    webbrowser.open('http://127.0.0.1:8050/', new=0, autoraise=True)
    app.run_server(debug=False)

```

At this point, you can test your app. Play with the URL paths to test your scripts

![](./readme_img/homeurl.png) 

![](./readme_img/moviesurl.png) 

![](./readme_img/youtubeurl.png)

## Create `commonmodules.py`

**What is this file for?** This file contains layouts or callbacks that are common to all modules. This excludes functions useful for all other modules. We will store them in another file called `utilities.py`

To start, let us create here the navbar components -- [see reference here](https://dash-bootstrap-components.opensource.faculty.ai/docs/components/navbar/). 

```python
# Usual Dash dependencies
import dash
import dash_bootstrap_components as dbc
from dash import dcc, html
from dash.exceptions import PreventUpdate

# Let us import the app object in case we need to define
# callbacks here
from app import app

navlink_style = {'color': '#fff', 'margin-right': '1.5em'}

navbar = dbc.Navbar(
    dbc.Container(
        [
            html.A(
                dbc.Row(
                    [
                        dbc.Col(dbc.NavbarBrand("IE 172 Case App", className="ms-2")),
                    ],
                    align="center",
                    className='g-0 me-4'
                ),
                href="/home",
                style={'textDecoration': 'none'}
            ),
            dbc.NavLink("Home", href="/home", style=navlink_style),
            dbc.NavLink("Movies", href="/movies", style=navlink_style),
            dbc.NavLink("Genres", href="/genres", style=navlink_style),
        ], className='m-0 justify-content-start'
        
    ),
    dark=True,
    color='dark'
)
```

Let us now add the navigation bar into `index.py` so that we can see it in the layout. 

1. Import `commonmodules` into `index.py`
    ```python
    from apps import commonmodules as cm
    ```

2. Add `navbar` into `app.layout`. The variable definition now looks like this. 
   ```python
    app.layout = html.Div(
        [
            # Location Variable -- contains details about the url
            dcc.Location(id='url', refresh=True),

            cm.navbar,

            # Page Content -- Div that contains page layout
            html.Div(id='page_content', className='m-2 p-2'),
        ]
    )
   ```

Test your app. Feel free to play with the menu items. 

![](./readme_img/navbar.png)


## Your App's Landing Page

