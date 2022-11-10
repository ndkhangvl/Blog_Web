<template>
<nav class="navbar navbar-expand-md navbar-light bg-light justify-content-between">
    <div class="mx-auto order-0">
        <a class="navbar-brand mx-auto" href="#">Blog Website</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
        <form class="form-inline">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/register">Register</a>
            </li>
        </ul>
    </div>
</nav>
</template> 

<style>
.navbar-brand
    {
    font-family: 'Lato', sans-serif;
    color:grey;
    font-size: 50px;
    margin: 0px;
    }
</style>