<cffunction name="libphonenumberFormat" returntype="string" output="false">
  <cfargument name="number" type="libphonenumber.PhoneNumber" required="true" />
  <cfargument name="format" type="string" required="true" />

  <!--- Format the given phone number --->
  <cfreturn arguments.number.format(arguments.format) />
</cffunction>