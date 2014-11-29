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
    Generates an example phone number for the region with specified code

    @param regionCode the region for which an example number is to be generated

    @return a instance of this component with the generated phone number
  --->
  <cffunction name="getExampleNumber" access="public" returntype="libphonenumber.PhoneNumber" output="false">
    <cfargument name="regionCode" type="string" required="true" />

    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />

    <!--- Parse number --->
    <cfset setNumber(phoneUtil.getExampleNumber(javaCast("string", arguments.regionCode))) />

    <cfreturn this />
  </cffunction>

  <!---
    Parses the specified phone number in string format

    @param numberToParse the phone number to try to parse
    @param defaultRegion the region that we are expecting the number to be from

    @return a instance of this component with the parsed phone number
  --->
  <cffunction name="parse" access="public" returntype="libphonenumber.PhoneNumber" output="false">
    <cfargument name="numberToParse" type="string" required="true" />
    <cfargument name="defaultRegion" type="string" required="true" />

    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />

    <!--- Parse number --->
    <cftry>
      <cfset setNumber(phoneUtil.parse(javaCast("string", arguments.numberToParse), javaCast("string", arguments.defaultRegion))) />

      <!--- Handle errors --->
      <cfcatch type="com.google.i18n.phonenumbers.NumberParseException">
        <cfthrow type="libphonenumber.PhoneNumber"
                 message="Unable to parse #arguments.numberToParse#" />
      </cfcatch>
    </cftry>

    <cfreturn this />
  </cffunction>

  <!---
    Formats the phone number

    @param format the format in which the the phone number is to be formatted

    @return the formatted phone number
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
    Formats a phone number when called from the region with specified code

    @param regionCallingFrom the code of the region from where the phone number is called

    @return the formatted phone number
  --->
  <cffunction name="formatOutOfCountryCallingNumber" access="public" returntype="string" output="false">
    <cfargument name="regionCallingFrom" type="string" output="false" />

    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />

    <cfreturn phoneUtil.formatOutOfCountryCallingNumber(getNumber(), javaCast("string", arguments.regionCallingFrom)) />
  </cffunction>

  <!--->
    Retrieves the type of the phone number

    @param number the phone number for which the type is to be queried

    @return the type of the phone number
  --->
  <cffunction name="getNumberType" access="public" returntype="string" output="false">
    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />

    <cfreturn phoneUtil.getNumberType(getNumber()).toString() />
  </cffunction>

  <!---
    Retrieves the region code of the phone number

    @param number the phone number for which the region code is to be queried

    @return the region code of the phone number
  --->
  <cffunction name="getRegionCodeForNumber" access="public" returntype="string" output="false">
    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />

    <cfreturn phoneUtil.getRegionCodeForNumber(getNumber()) />
  </cffunction>

  <!---
    Retrieves the country code of the phone number

    @param number the phone number for which the country code is to be queried

    @return the country code of the phone number
  --->
  <cffunction name="getCountryCodeForNumber" access="public" returntype="string" output="false">
    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />
    <cfset var regionCode = phoneUtil.getRegionCodeForNumber(getNumber()) />

    <cfreturn phoneUtil.getCountryCodeForRegion(regionCode) />
  </cffunction>

  <!---
    Checks if the phone number is valid

    @return true if the phone number is valid, false otherwise
  --->
  <cffunction name="isValidNumber" access="public" returntype="boolean" output="false">
    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />

    <cfreturn phoneUtil.isValidNumber(getNumber()) />
  </cffunction>

  <!---
    Checks if the phone number is valid for the region with specified code

    @param regionCode the code of the region for validating the phone number

    @return true if the phone number is valid for the given region, false otherwise
  --->
  <cffunction name="isValidNumberForRegion" access="public" returntype="boolean" output="false">
    <cfargument name="regionCode" type="string" required="true" />

    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />

    <cfreturn phoneUtil.isValidNumberForRegion(getNumber(), javaCast("string", arguments.regionCode)) />
  </cffunction>

  <!---
    Retrieves the country code of the region with specified code

    @param regionCode the code of the region for which the country code is to be queried

    @return the country code for the given region
  --->
  <cffunction name="getCountryCodeForRegion" access="public" returntype="numeric" output="false">
    <cfargument name="regionCode" type="string" required="true" />

    <!--- Define local variables --->
    <cfset var phoneUtil = createObject("java", "com.google.i18n.phonenumbers.PhoneNumberUtil").getInstance() />

    <cfreturn phoneUtil.getCountryCodeForRegion(javaCast("string", arguments.regionCode)) />
  </cffunction>
</cfcomponent>