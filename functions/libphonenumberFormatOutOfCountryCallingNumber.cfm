<cffunction name="libphonenumberFormatOutOfCountryCallingNumber" returntype="string" output="false">
  <cfargument name="number" type="libphonenumber.PhoneNumber" required="true" />
  <cfargument name="regionCallingFrom" type="string" output="false" />

  <!--- Format the given phone number --->
  <cfreturn arguments.number.formatOutOfCountryCallingNumber(arguments.regionCallingFrom) />
</cffunction>