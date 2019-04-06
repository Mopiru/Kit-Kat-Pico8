score = 0

player = {}
player.x = 0
player.y = 0
player.sprite = 0

bullet = {}
bullet.x = 0
bullet.y = 0
bullet.sprite = 1
bullet.is_shot = 0

function bullet:shot()
    if bullet.is_shot == 0 then
        bullet.x = player.x
        bullet.y = player.y + 8
        bullet.is_shot = 1
    end
end

function bullet:update()
    if bullet.is_shot == 1 then
        bullet.y -= 4
        if bullet.y < -10 then
            bullet. y = -100
            bullet.is_shot = 0
        end
    end
end

ennemy = {}
ennemy.x = 0
ennemy.y = 0
ennemy.sprite = 16
ennemy.is_dead = 0

function ennemy:update()
    if ennemy.is_dead == 1 then
        ennemy.y = rnd(60)
        ennemy.x = -10
        ennemy.is_dead = 0
    end
    if ennemy.is_dead == 0 then
        ennemy.x += 2
    end
    if ennemy.x > 130 then
        ennemy.is_dead = 1
        score -= 1
    end
    if bullet.y < ennemy.y + 5 and bullet.y > ennemy.y -5  and bullet.x < ennemy.x + 5 and bullet.x > ennemy.x - 5 then
        ennemy.is_dead = 1
        score += 1
    end
end

function _init()
    bullet.x = -100
    bullet.y = -100
    ennemy.x = 0
    ennemy.y = 0
    player.x = 64
    player.y = 110
end

function _draw()
    cls(0)
    mapdraw(0)
    print("score=", 0, 0)
    print(score, 25, 0)
    spr(player.sprite, player.x, player.y)
    spr(bullet.sprite, bullet.x, bullet.y)
    spr(ennemy.sprite, ennemy.x, ennemy.y)
end

function _update()
    if btn(0) then
        if player.x > 0 then
            player.x -= 4
        end
    end
    if btn(1) and player.x < 120 then
        player.x += 4
    end
    if btn(2) and player.y > 98 then
        player.y -= 4
    end
    if btn(3) and player.y < 118 then
        player.y +=4
    end
    if btn(4) then
        bullet:shot()
    end
    bullet:update()
    ennemy:update()
end