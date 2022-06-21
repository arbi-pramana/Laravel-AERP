@if(!empty($data))
{{setting('system-setting.journal_prefix').str_pad($data->id,5,'0',STR_PAD_LEFT)}}
@else
{{setting('system-setting.journal_prefix').str_pad($dataTypeContent->id,5,'0',STR_PAD_LEFT)}}
@endif