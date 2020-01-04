<div class="hero-section hero-section-small">
</div>
<div class="about-section">
    <section class="container">

        <div class="text-danger text-uppercase font-weight-bold">
        <?php if (isset($_SESSION['mess'])) {
            echo $_SESSION['mess'];
            unset($_SESSION['mess']);
        } ?></div>
        <form action="/pets/buy" method="post">

            <div class="row">
                <div class="col-sm-6">
                    <h2>Покупатели</h2>
                    <table class="table table-bordered">
                        <tr>
                            <th></th>
                            <th>Имя</th>
                            <th>Деньги</th>
                        </tr>
                        <?php while($row = $users -> fetch_assoc()) { ?>
                            <tr>
                                <td class="w30">
                                    <input type="radio" name="user" value="<?php echo $row['id'];?>">
                                </td>
                                <td class="padding-left-5">
                                    <?php echo hc($row['name']); ?>
                                </td>
                                <td class="padding-left-5">
                                    <?php echo (float)$row['money']; ?>
                                </td>
                            </tr>
                        <?php }
                        $users -> close();?>
                    </table>
                </div>

                <div class="col-sm-6">
                    <h2>Питомцы</h2>
                    <table class="table table-bordered">
                        <tr>
                            <th></th>
                            <th>Питомец</th>
                            <th>Цена</th>
                        </tr>
                        <?php while($row = $pets -> fetch_assoc()) { ?>
                            <tr>
                                <td class="w30">
                                    <input type="radio" name="pet" value="<?php echo $row['id'];?>">
                                </td>
                                <td class="padding-left-5">
                                    <?php echo hc($row['name']); ?>
                                </td>
                                <td class="padding-left-5">
                                    <?php echo (float)$row['cost']; ?>
                                </td>
                            </tr>
                        <?php }
                        $pets -> close();?>
                    </table>
                </div>
            </div>
            <input type="submit" name="submit" class="btn btn-success center-block" value="Купить">
        </form>


        <div class="">
            <h2>Уже купили:</h2>
            <table class="table table-bordered">
                <tr>
                    <th>Хозяин</th>
                    <th>Питомец</th>
                </tr>
                <?php while($row = $user_pet -> fetch_assoc()) { ?>
                    <tr>
                        <td class="padding-left-5">
                            <?php echo hc($row['user']); ?>
                        </td>
                        <td class="padding-left-5">
                            <?php if (empty($row['pet'])) {
                                echo '-';
                            } else {
                                echo hc($row['pet']);
                            } ?>
                        </td>
                    </tr>
                <?php }
                $user_pet -> close();?>
            </table>
        </div>
    </section>
</div>
