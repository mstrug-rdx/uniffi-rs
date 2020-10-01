// This file was autogenerated by some hot garbage in the `uniffi` crate.
// Trust me, you don't want to mess with it!

{%- for rec in ci.iter_record_definitions() %}
dictionary {{ rec.name()|class_name_webidl(context)  }} {
  {%- for field in rec.fields() %}
  {% if field.required() -%}required{%- else -%}{%- endif %} {{ field.webidl_type()|type_webidl(context) }} {{ field.name()|var_name_webidl }}
  {%- match field.webidl_default_value() %}
  {%- when Some with (literal) %} = {{ literal|literal_webidl }}
  {%- else %}
  {%- endmatch %};
  {%- endfor %}
};
{% endfor %}

{%- for e in ci.iter_enum_definitions() %}
enum {{ e.name()|class_name_webidl(context)  }} {
  {% for variant in e.variants() %}
  "{{ variant|enum_variant_webidl }}"{%- if !loop.last %}, {% endif %}
  {% endfor %}
};
{% endfor %}

{%- let functions = ci.iter_function_definitions() %}
{%- if !functions.is_empty() %}
[ChromeOnly, Exposed=Window]
namespace {{ context.namespace()|class_name_webidl(context) }} {
  {% for func in functions %}
  {%- if func.throws().is_some() %}
  [Throws]
  {% endif %}
  {%- match func.webidl_return_type() -%}{%- when Some with (type_) %}{{ type_|type_webidl(context) }}{% when None %}void{% endmatch %} {{ func.name()|fn_name_webidl }}(
    {%- for arg in func.arguments() %}
    {% if arg.optional() -%}optional{%- else -%}{%- endif %} {{ arg.webidl_type()|type_webidl(context) }} {{ arg.name() }}
    {%- match arg.webidl_default_value() %}
    {%- when Some with (literal) %} = {{ literal|literal_webidl }}
    {%- else %}
    {%- endmatch %}
    {%- if !loop.last %}, {% endif %}
    {%- endfor %}
  );
  {% endfor %}
};
{% endif -%}

{%- for obj in ci.iter_object_definitions() %}
[ChromeOnly, Exposed=Window]
interface {{ obj.name()|class_name_webidl(context)  }} {
  {%- for cons in obj.constructors() %}
  {%- if cons.throws().is_some() %}
  [Throws]
  {% endif %}
  constructor(
      {%- for arg in cons.arguments() %}
      {% if arg.optional() -%}optional{%- else -%}{%- endif %} {{ arg.webidl_type()|type_webidl(context) }} {{ arg.name() }}
      {%- match arg.webidl_default_value() %}
      {%- when Some with (literal) %} = {{ literal|literal_webidl }}
      {%- else %}
      {%- endmatch %}
      {%- if !loop.last %}, {% endif %}
      {%- endfor %}
  );
  {%- endfor %}

  {% for meth in obj.methods() -%}
  {%- if meth.throws().is_some() %}
  [Throws]
  {% endif %}
  {%- match meth.webidl_return_type() -%}{%- when Some with (type_) %}{{ type_|type_webidl(context) }}{% when None %}void{% endmatch %} {{ meth.name()|fn_name_webidl }}(
      {%- for arg in meth.arguments() %}
      {% if arg.optional() -%}optional{%- else -%}{%- endif %} {{ arg.webidl_type()|type_webidl(context) }} {{ arg.name() }}
      {%- match arg.webidl_default_value() %}
      {%- when Some with (literal) %} = {{ literal|literal_webidl }}
      {%- else %}
      {%- endmatch %}
      {%- if !loop.last %}, {% endif %}
      {%- endfor %}
  );
  {% endfor %}
};
{% endfor %}
