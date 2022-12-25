<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="entity.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: pavel
  Date: 25.10.2022
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,900;1,400&display=swap"
          rel="stylesheet">
    <script src="https://kit.fontawesome.com/bd02cb2387.js" crossorigin="anonymous"></script>
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"
        integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk"
        crossorigin="anonymous"></script>


<nav class="navbar navbar-expand-lg navbar fixed-top navbar-dark bg-dark n">
    <div class="container-fluid">
        <a class="navbar-brand" href="<c:url value="/product"/>"><i class="fa-solid fa-fan"></i> Dragi</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <c:if test="${sessionScope != null}">
                <c:if test="${sessionScope.currentUser != null}">
                <li class="nav-item col-6 col-lg-auto">
                    <a class="nav-link" role="button" href="<c:url value="/basket"/>">
                        <i class="fa-solid fa-basket-shopping"></i>
                        <small class="d-lg-none ms-2">Basket</small>
                    </a>
                </li>
                <li class="nav-item dropdown col-6 col-lg-auto">
                    <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <i class="fa-solid fa-user"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" aria-current="page" href="<c:url value="/?exit=true"/>">Выйти из
                            аккаунта</a>
                        </li>
                        <c:if test="${sessionScope.currentRole != null}">
                            <c:if test="${!(sessionScope.currentRole.equals('seller'))}">
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li>
                                    <button class="dropdown-item" data-bs-toggle="modal"
                                            data-bs-target="#staticBackdrop"
                                            type="submit">Стать продавцом
                                    </button>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.currentRole.equals('seller')}">
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li>
                                    <a href="<c:url value="/products/my-products"/>" class="dropdown-item"
                                       type="submit">Мои
                                        продукты</a>
                                </li>
                            </c:if>
                        </c:if>
                    </ul>
                    </c:if>
                    <c:if test="${sessionScope.currentUser == null}">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="<c:url value="/authorisation"/>">Вход
                                    и регистрация</a>
                            </li>
                        </ul>
                    </c:if>
                    </c:if>
                    <c:if test="${sessionScope == null}">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="<c:url value="/authorisation"/>">Вход
                                    и регистрация</a>
                            </li>
                        </ul>
                    </c:if>

                </li>
                <li class="nav-item">
                    <c:if test="${sessionScope.currentRole != null}">
                        <c:if test="${sessionScope.currentRole.equals('seller')}">
                            <a class="btn btn-outline-light" href="<c:url value="/add"/>" type="submit">Разместить
                                объявление</a>
                        </c:if>
                        <c:if test="${!(sessionScope.currentRole.equals('seller'))}">
                            <button class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#needSeller"
                                    type="submit">Разместить объявление
                            </button>
                        </c:if>
                    </c:if>
                    <c:if test="${sessionScope.currentRole == null}">
                        <button class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#needSeller"
                                type="submit">Разместить объявление
                        </button>
                    </c:if>
                </li>
            </ul>
        </div>
    </div>
</nav>
<br>
<br>
<%System.out.println("AAAAAAAAAA"); %>
<section class="main-content">
    <div class="container-fluid">
        <div class="main row">
            <div class="col-sm-2">
                <div class="filter">
                    <div class="row">
                        <form method="get">
                            <div class="list-group aaa">
                                <button name="category" type="submit" value=""
                                        class="list-group-item list-group-item-action">Все категории
                                </button>
                                <button name="category" type="submit" value="Транспорт"
                                        class="list-group-item list-group-item-action">Транспорт
                                </button>
                                <button name="category" type="submit" value="Недвижимость"
                                        class="list-group-item list-group-item-action">Недвижимость
                                </button>
                                <button name="category" type="submit" value="Работа"
                                        class="list-group-item list-group-item-action">Работа
                                </button>
                                <button name="category" type="submit" value="Услуги"
                                        class="list-group-item list-group-item-action">Услуги
                                </button>
                                <button name="category" type="submit" value="Личные вещи"
                                        class="list-group-item list-group-item-action">Личные вещи
                                </button>
                                <button name="category" type="submit" value="Для дома и дачи"
                                        class="list-group-item list-group-item-action">Для дома и дачи
                                </button>
                                <button name="category" type="submit" value="Электроника"
                                        class="list-group-item list-group-item-action">Электроника
                                </button>
                                <button name="category" type="submit" value="Хобби и отдых"
                                        class="list-group-item list-group-item-action">Хобби и отдых
                                </button>
                                <button name="category" type="submit" value="Животные"
                                        class="list-group-item list-group-item-action">Животные
                                </button>
                                <button name="category" type="submit" value="Готовый бизнес и оборудование"
                                        class="list-group-item list-group-item-action">Готовый бизнес и оборудование
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-10">
                <div class="container">
                    <c:if test="${requestScope.products != null}">
                    <c:if test="${!(requestScope.products.isEmpty())}">
                    <div class="row">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                Фильтровать
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="<c:url value="/?sort="/>">По умолчанию</a></li>
                                <li><a class="dropdown-item" href="<c:url value="/?sort=expensive"/>">Дороже</a></li>
                                <li><a class="dropdown-item" href="<c:url value="/?sort=cheap"/>">Дешевле</a></li>
                                <li><a class="dropdown-item" href="<c:url value="/?sort=date"/>">По дате</a></li>
                            </ul>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <c:forEach var="product" items="${requestScope.products}">
                            <div class="col-lg-4 col-sm-6 ">
                                <div class="card product-card ">
                                    <img class="card-img-top" alt="Картинка" height="400px" width="auto"
                                         src="/images/${product.getName()}"/>
                                    <div class="card-body">
                                        <h5 class="card-title">${product.getName()}</h5>
                                        <p class="card-text">${product.getPrice()} руб.</p>
                                        <a href="<c:url value="/product?name=${product.getName()}"/>"
                                           class="btn btn-primary">Перейти</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                </c:if>
                <c:if test="${requestScope.products.isEmpty()}">
                    <h1>Товаров пока нет</h1>
                </c:if>
                </c:if>
            </div>
        </div>
    </div>

</section>
</body>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">VIP</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Для того, чтобы продавать на этой площадке, нужно оплатить платную подписку за 399 рублей
                <br>
                Реквизиты:
                <br>
                По номеру телефона +79911153704 Сбербанк, в сообщении указать "Хочу быть легендой"
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a href="<c:url value="/?seller=yes"/>" type="button" class="btn btn-primary">ОК</a>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="needSeller" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="needSellerLabel">VIP</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Для того, чтобы продавать на этой площадке, нужно приобрести права продавца.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</html>


<%--<style>--%>
<%--    html {--%>
<%--        font-size: 16px;--%>
<%--    }--%>

<%--    body {--%>
<%--        font-family: 'Roboto', sans-serif;--%>
<%--        font-size: 16px;--%>
<%--        color: #000;--%>
<%--        background: #fff;--%>
<%--    }--%>

<%--    img {--%>
<%--        max-height: 100%;--%>

<%--    }--%>

<%--    section {--%>
<%--        padding: 50px 0;--%>
<%--    }--%>

<%--    h1 {--%>
<%--        color: black;--%>
<%--        text-align: center;--%>
<%--    }--%>

<%--    .col-md-3 .filter {--%>
<%--        background: gray;--%>
<%--    }--%>

<%--    .product-card {--%>
<%--        margin-top: 20px;--%>
<%--    }--%>

<%--    .aaa {--%>
<%--        margin-left: 20px;--%>
<%--    }--%>

<%--</style>--%>