<?php

function clamp(int $value,int $min,int $max) : int {
    return max($min, min($max, $value));
}

?>