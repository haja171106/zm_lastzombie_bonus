#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\zombies\_zm_powerups;

init()
{
    level thread last_zombie_bonus_watcher();
}

last_zombie_bonus_watcher()
{
    level endon( "end_game" );

    flag_wait( "initial_blackscreen_passed" );

    for ( ;; )
    {
        level waittill( "start_of_round" );
        level thread watch_current_round();
    }
}

watch_current_round()
{
    level endon( "end_game" );
    level endon( "end_of_round" );

    last_origin = undefined;
    zombies_seen = false;

    for ( ;; )
    {
        zombies = get_round_enemy_array();

        if ( isDefined( zombies ) && zombies.size > 0 )
        {
            zombies_seen = true;

            // On garde la position du dernier zombie vivant
            if ( zombies.size == 1 && isDefined( zombies[0] ) )
                last_origin = zombies[0].origin;
        }

        // Plus aucun zombie à spawner ni en vie => le dernier vient de mourir
        if ( zombies_seen && level.zombie_total <= 0 && ( !isDefined( zombies ) || zombies.size == 0 ) )
        {
            if ( isDefined( last_origin ) )
                give_last_zombie_bonuses( last_origin );

            return;
        }

        wait 0.05;
    }
}

give_last_zombie_bonuses( origin )
{
    // Décalage pour que les deux bonus ne se superposent pas
    specific_powerup_drop( "full_ammo", origin + ( 25, 0, 0 ) );
    wait 0.1;
    specific_powerup_drop( "carpenter", origin + ( -25, 0, 0 ) );
}
