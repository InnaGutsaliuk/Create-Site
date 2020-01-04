<div id="hero" class="hero-section">
    <div id="hero-carousel" class="hero-carousel carousel carousel-fade slide" data-ride="carousel" data-interval="10000">
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item item-3 active">
                <div class="item-content container">
                    <div class="item-content-inner">
                        <h1 class="heading">Вам нужно создать сайт?</h1>
                        <p class="intro">Тогда Вы попали именно туда, куда Вам нужно! Создание сайтов любой
                            сложности, сопровождение, доработка уже существующих сайтов, СЕО-оптимизация - все это и
                            даже больше вы можете заказать у нас!
                        </p>
                        <!-- Button trigger modal -->
                        <button type="button" id="button" class="btn btn-primary btn-cta" data-toggle="modal"
                                data-target="#exampleModal">
                            Заказать звонок
                        </button>
                    </div><!--//item-content-inner-->
                </div>
            </div><!--//item-->
        </div><!--//carousel-inner-->
    </div><!--//carousel-->
</div><!--//hero-->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-size-25 font-weight-bold" id="exampleModalCenterTitle">Оставьте заявку и
                    мы<br> обязательно Вам перезвоним</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="exampleModalCenterBody">
                <div class="form-timer">
                    <form method="post">
                        <table>
                            <tr>
                                <td>Ваше имя*</td>
                                <td class="width-80"><input type="text" id="inputName" name="name" onkeyup="checkParams()"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td id="error-name"></td>
                            </tr>
                            <tr>
                                <td>Ваш телефон*</td>
                                <td><input type="text" id="inputTel" name="tel" onkeyup="checkParams()"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td id="error-tel"></td>
                            </tr>
                        </table>
                        <input type="submit" name="submit" value="Оставить заявку" onclick="return MyModal();">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div><!--//Modal-->


<div id="about" class="about-section">
    <section class="container text-center">
        <h2 class="section-title">Разработка сайта с использованием современных технологий</h2>
        <p class="intro">Сайты разрабатываются с использованием последних технологий, но в то же время прекрасно
            работают на старых версиях браузеров. </p>
        <ul class="technologies list-inline">
            <li><img src="/skins/img/logo-bootstrap.svg" alt="Bootstrap" width="56" height="55"></li>
            <li><img src="/skins/img/logo-html5.svg" alt="HTML5" width="53" height="60"></li>
            <li><img src="/skins/img/logo-css3.svg" alt="CSS3" width="53" height="60"></li>
            <li><img src="/skins/img/logo-less.svg" alt="Less" width="90" height="41"></li>
            <li><img src="/skins/img/logo-jquery.svg" alt="jQuery" width="132" height="30"></li>
            <li><img src="/skins/img/logo-php.png" alt="PHP" width="111" height="60"></li>
            <li><img src="/skins/img/logo-mysql.png" alt="MySql" width="115" height="60"></li>
        </ul>

        <div class="items-wrapper row">
            <div class="item col-sm-4 col-xs-12">
                <div class="item-inner">
                    <div class="figure-holder">
                        <img class="figure-image" src="/skins/img/figure-1.png" alt="image" height="163" width="166">
                    </div><!--//figure-holder-->
                    <h3 class="item-title">Удобный дизайн</h3>
                    <div class="item-desc">
                        Простой и удобный для пользователей дизайн. Можем сделать дизайн сайта по Вашему макету, можем
                        предложить свои варианты.
                    </div><!--//item-desc-->
                </div><!--//item-inner-->
            </div><!--//item-->
            <div class="item col-sm-4 col-xs-12">
                <div class="item-inner">
                    <div class="figure-holder">
                        <img class="figure-image" src="/skins/img/figure-2.png" alt="image" height="148" width="207">
                    </div><!--//figure-holder-->
                    <h3 class="item-title">Короткие сроки</h3>
                    <div class="item-desc">
                        Использование готовых шаблонов и CMS помогает разрабатывать сайты максимально быстро и
                        качественно.
                    </div><!--//item-desc-->
                </div><!--//item-inner-->
            </div><!--//item-->
            <div class="item col-sm-4 col-xs-12">
                <div class="item-inner">
                    <div class="figure-holder">
                        <img class="figure-image" src="/skins/img/figure-3.png" alt="image" height="135" width="115">
                    </div><!--//figure-holder-->
                    <h3 class="item-title">Мобильная версия</h3>
                    <div class="item-desc">
                        Ваш сайт будет прекрасно выглядеть и работать с любого устройства.
                    </div><!--//item-desc-->
                </div><!--//item-inner-->
            </div><!--//item-->
        </div><!--//items-wrapper-->
    </section><!--//container-->
</div><!--//about-section-->

<div id="testimonials" class="testimonials-section">
    <section class="container">
        <h2 class="section-title text-center">Этапы создания сайта</h2>
        <div class="item center-block">
            <div class="profile-holder">
                <img class="profile-image" src="/skins/img/icon1.png" alt="profile">
            </div>
            <div class="quote-holder">
                <blockquote class="quote">
                    <p><span class="quote-title">Обсуждение проекта.</span><br>
                    Встречаемся лично, либо обсуждаем по телефону все Ваши пожелания. Определяемся с видом сайта и
                        необходимым функционалом.</p>
                </blockquote>
            </div><!--//quote-holder-->
        </div><!--//item-->
        <div class="item item-reversed center-block">
            <div class="profile-holder">
                <img class="profile-image" src="/skins/img/icon2.png" alt="profile">
            </div>
            <div class="quote-holder">
                <blockquote class="quote">
                    <p><span class="quote-title">Разработка концепции и плана работ.</span><br>
                        Определяемся с дизайном и функционалом. Разрабатываем техническое задание. Утверждаем цену и
                        сроки выполнения работ.
                    </p>
                </blockquote>
            </div><!--//quote-holder-->
        </div><!--//item-->
        <div class="item center-block">
            <div class="profile-holder">
                <img class="profile-image" src="/skins/img/logo-dark-gray.png" alt="profile">
            </div>
            <div class="quote-holder">
                <blockquote class="quote">
                    <p><span class="quote-title">Создание сайта, тестирование.</span><br>
                        Наши разработчики создают Ваш сайт. Дизайн, программные модули, система администрирования -
                        все делается на высшем уровне. Также сайт проходит обязательное тестирование.
                    </p>
                </blockquote>
            </div><!--//quote-holder-->
        </div><!--//item-->
        <div class="item item-reversed center-block">
            <div class="profile-holder">
                <img class="profile-image" src="/skins/img/icon4.png" alt="profile">
            </div>
            <div class="quote-holder">
                <blockquote class="quote">
                    <p><span class="quote-title">Сдача проекта.</span><br>
                        Вы принимаете работу и оплачиваете ее. Сайт размещается на хостинге, а Вы получаете гарантийное
                       обслуживание и техническую поддержку.
                    </p>
                </blockquote>
            </div><!--//quote-holder-->
        </div><!--//item-->
    </section><!--//container-->
</div><!--//testimonials-->

<div id="features" class="features-section">
    <section class="container text-center">
        <h2 class="section-title">Виды сайтов</h2>
        <p class="intro">Любые виды сайтов, учтем все Ваши пожелания.</p>
        <div class="tabbed-area row">
            <!-- Nav tabs -->
            <ul class="feature-nav nav nav-pill nav-stacked text-left col-md-4 col-sm-6 col-xs-12 col-md-push-8 col-sm-push-6 col-xs-push-0" role="tablist">
                <li role="presentation"><a href="#feature-1" aria-controls="feature-2" role="tab"
                                           data-toggle="tab"><i class="fa fa-check"></i>Лендинги</a></li>
                <li role="presentation"><a href="#feature-2" aria-controls="feature-3" role="tab"
                                           data-toggle="tab"><i class="fa fa-check"></i>Сайты-визитки</a></li>
                <li role="presentation"><a href="#feature-3" aria-controls="feature-4" role="tab"
                                           data-toggle="tab"><i class="fa fa-check"></i>Корпоративные сайты</a></li>
                <li role="presentation"><a href="#feature-4" aria-controls="feature-5" role="tab"
                                           data-toggle="tab"><i class="fa fa-check"></i>Сайты-каталоги</a></li>
                <li role="presentation"><a href="#feature-5" role="tab"
                                           data-toggle="tab"><i class="fa fa-check"></i>Интернет-магазины</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="feature-content tab-content col-md-8 col-sm-6 col-xs-12 col-md-pull-4 col-sm-pull-6 col-xs-pull-0">
                <div role="tabpanel" class="tab-pane fade in active" id="feature-1">
                    <img class="img-responsive img-border" src="/skins/img/landing-page.jpg" alt="screenshot">
                </div>
                <div role="tabpanel" class="tab-pane fade" id="feature-2">
                    <img class="img-responsive img-border" src="/skins/img/vizitka.jpg" alt="screenshot" >
                </div>
                <div role="tabpanel" class="tab-pane fade" id="feature-3">
                    <img class="img-responsive img-border" src="/skins/img/corporativ-site.jpg" alt="screenshot" >
                </div>
                <div role="tabpanel" class="tab-pane fade" id="feature-4">
                    <img class="img-responsive img-border" src="/skins/img/catalog.jpg" alt="screenshot" >
                </div>
                <div role="tabpanel" class="tab-pane fade" id="feature-5">
                    <img class="img-responsive img-border" src="/skins/img/shop.png" alt="screenshot" >
                </div>

            </div><!--//feature-content-->
        </div><!--//tabbed-area-->
    </section><!--//container-->
</div><!--//features-->

<div id="pricing" class="pricing-section">
    <section class="container text-center">
        <h2 class="section-title">Цены</h2>
        <div class="pricing-wrapper">
            <div class="item item-1 col-md-4 col-sm-4 col-xs-12">
                <div class="item-inner">
                    <h3 class="item-heading">Одностраничный сайт</h3>
                    <div class="price-figure">
                        <span class="currency">от</span><span class="number"> 250 </span><span
                                class="currency">руб</span>
                    </div><!--//price-figure-->
                    <div class="price-desc">
                        <p>Одностраничный сайт-визитка или лендинг.</p>
                        <p class="price-desc-p">Срок разработки от 5 дней</p>
                    </div><!--//price-desc-->
                </div><!--//item-inner-->
            </div><!--//item-->
            <div class="item item-2 col-md-4 col-sm-4 col-xs-12">
                <div class="item-inner">
                    <h3 class="item-heading">Сайт-каталог</h3>
                    <div class="price-figure">
                        <span class="currency">от</span><span class="number"> 450 </span><span
                                class="currency">руб</span>
                    </div><!--//price-figure-->
                    <div class="price-desc">
                        <p>Многостраничный сайт-каталог.</p>
                        <p class="price-desc-p">Срок разработки от 10 дней</p>
                    </div><!--//price-desc-->
                </div><!--//item-inner-->
            </div><!--//item-->

            <div class="item item-3 col-md-4 col-sm-4 col-xs-12">
                <div class="item-inner">
                    <h3 class="item-heading">Интернет-магазин</h3>
                    <div class="price-figure">
                        <span class="currency">от</span><span class="number"> 600 </span><span
                                class="currency">руб</span>
                    </div><!--//price-figure-->
                    <div class="price-desc">
                        <p>Полнофункциональный интернет-магазин.</p>
                        <p class="price-desc-p">Срок разработки от 14 дней</p>
                    </div><!--//price-desc-->
                </div><!--//item-inner-->
            </div><!--//item-->
        </div><!--//pricing-wrapper-->
    </section><!--//container-->
</div><!--//pricing-section-->
<div id="contact" class="contact-section">
    <section class="container text-center">
        <h2 class="section-title">Контакты</h2>
        <div class="contact-content">
            <i class="fa fa-phone"> </i> <a href="tel:+375296049230">+375 (29) 604-92-30</a><br>
            <i class="fa fa-envelope"> </i> <a href="mailto:innlina@mail.ru">innlina@mail.ru</a><br>
            <i class="fa fa-skype"> </i> <a href="skype:innlina?call">innlina</a>
        </div>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary btn-cta" data-toggle="modal" data-target="#exampleModal"
                id="button1">
            Заказать звонок
        </button>
    </section><!--//container-->
</div><!--//contact-section-->