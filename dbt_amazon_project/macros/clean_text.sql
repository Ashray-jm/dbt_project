-- macros/clean_text.sql

{% macro clean_text(input_column) %}
    regexp_replace(
        trim(
            regexp_replace(
                regexp_replace(
                    regexp_replace(
                        regexp_replace(
                            regexp_replace({{ input_column }}, '[:\[\]"{}【】]+', ' ', 'g'),  -- Remove unwanted characters
                            '[A-Za-z0-9]{8,}', '', 'g'  -- Remove long alphanumeric strings (≥8)
                        ),
                        '\d{5,}', '', 'g'  -- Remove long digit-only strings (≥5)
                    ),
                    ' ,', ',', 'g'  -- Fix spaces before commas
                ),
                ',,,', ',', 'g'  -- Replace triple commas
            )
        ), '', ''  -- Final trimming step
    )
{% endmacro %}
