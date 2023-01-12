<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Kanban</title>
        <link href="{{ mix('css/app.css') }}" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <input type="hidden" name="token" id="token" value="{{env('API_TOKEN')}}">
        <div id="app">
            <Board/>
        </div>
        <script src="{{ mix('js/app.js') }}" type="text/javascript"></script>
    </body>
</html>