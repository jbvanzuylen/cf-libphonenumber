<cfcomponent displayname="PhoneNumber" output="false">
  <!---
    Retrieves the phone number

    @return the phone number
  ---->
  <cffunction name="getNumber" access="private" returntype="any" output="false">
    <cfreturn variables.number />
  </cffunction>

  <!---
    Set the phone number

    @param number the phone number to be set
  ---->
  <cffunction name="setNumber" access="private" returntype="void" output="false">
    <cfargument name="number" type="any" required="true" />

    <cfset variables.number = arguments.number />
  </cffunction>

  <!---
    Parses the specified string

    @param numberToParse the number to try to parse
    @param defaultRegion the region that we are expecting the number to be from

    @return a instance of this component
  --->
  <cffunction name="parse" access="public" returntype="libphonenumber.PhoneNumber" output="false">
    <cfargument name="numberToParse" type="string" required="true" />
    <cfargument name="defaultRegion" type="string" required="true" />

    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />

    <!--- Parse number --->
    <cfset setNumber(phoneUtil.parse(javaCast("string", arguments.numberToParse), javaCast("string", arguments.defaultRegion))) />

    <cfreturn this />
  </cffunction>

  <!---
    Formats the number
  --->
  <cffunction name="format" access="public" returntype="string" output="false">
    <cfargument name="format" type="string" required="true" />

    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />
    <cfset var phoneUtilFormat = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil$PhoneNumberFormat") />
    <cfset var formatEnumConstant = "" />

    <!--- Map the format --->
    <cfswitch expression="#arguments.format#">
      <cfcase value="E164">
        <cfset formatEnumConstant = phoneUtilFormat.E164 />
      </cfcase>
      <cfcase value="INTERNATIONAL">
        <cfset formatEnumConstant = phoneUtilFormat.INTERNATIONAL />
      </cfcase>
      <cfcase value="NATIONAL">
        <cfset formatEnumConstant = phoneUtilFormat.NATIONAL />
      </cfcase>
      <cfcase value="RFC3966">
        <cfset formatEnumConstant = phoneUtilFormat.RFC3966 />
      </cfcase>
      <cfdefaultcase>
        <cfthrow type="libphonenumber.PhoneNumber"
                 message="Invalid format"
                 detail="Valid image types are E164, INTERNATIONAL, NATIONAL and RFC3966" />
      </cfdefaultcase>
    </cfswitch>

    <cfreturn phoneUtil.format(getNumber(), formatEnumConstant) />
  </cffunction>

  <!---
    Checks if the phone is valid

    @return true if the phone number is valid, false otherwise
  --->
  <cffunction name="isValid" access="public" output="false">
    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />

    <cfreturn phoneUtil.isValidNumber(variables.number) />
  </cffunction>

  <!---
    Checks if the phone is valid for the region with specified code

    @param regionCode the code of the region for validating the phone number

    @return true if the phone number is valid for the given region, false otherwise
  --->
  <cffunction name="isValidForRegion" access="public" returntype="boolean" output="false">
    <cfargument name="regionCode" type="string" required="true" />

    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />

    <cfreturn phoneUtil.isValidNumberForRegion(variables.number, javaCast("string", arguments.regionCode)) />
  </cffunction>
</cfcomponent>