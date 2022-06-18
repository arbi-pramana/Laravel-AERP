<?php
namespace App\Utility;

class Formatting{
    function price($price){
        if(setting('system-setting.currency_symbol_position') == "pre"){
            return setting('system-setting.currency_symbol')." ".number_format($price,setting('system-setting.decimal_number_format'),",",".");
        } else {
            return number_format($price,2,",",".")." ".setting('system-setting.currency_symbol');
        }
    }

    function date($date){
        return date(setting('system-setting.date_format'),strtotime($date));
    }
}