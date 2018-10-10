{*
 +--------------------------------------------------------------------+
 | CiviCRM version 4.7                                                |
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC (c) 2004-2018                                |
 +--------------------------------------------------------------------+
 | This file is a part of CiviCRM.                                    |
 |                                                                    |
 | CiviCRM is free software; you can copy, modify, and distribute it  |
 | under the terms of the GNU Affero General Public License           |
 | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
 |                                                                    |
 | CiviCRM is distributed in the hope that it will be useful, but     |
 | WITHOUT ANY WARRANTY; without even the implied warranty of         |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
 | See the GNU Affero General Public License for more details.        |
 |                                                                    |
 | You should have received a copy of the GNU Affero General Public   |
 | License and the CiviCRM Licensing Exception along                  |
 | with this program; if not, contact CiviCRM LLC                     |
 | at info[AT]civicrm[DOT]org. If you have questions about the        |
 | GNU Affero General Public License or the licensing of CiviCRM,     |
 | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
 +--------------------------------------------------------------------+
*}
{* If you want a custom profile view, you can access field labels and values in $profileFields_N array - where N is profile ID. *}
{* EXAMPLES *}{* $profileFields_1.last_name.label *}{* $profileFields_1.last_name.value *}

{if $overlayProfile }
    {foreach from=$profileGroups item=group}
        <div class="crm-summary-group">
           {$group.content}
        </div>
    {/foreach}
{else}
    {foreach from=$profileGroups item=group}

        {if $groupID EQ 32 || $groupID EQ 33 || $groupID EQ 42 || $groupID EQ 43 || $groupID EQ 44 || $groupID EQ 45}  
			
			<div id="profilewrap{$groupID}" class="crm-profile-view">
				<div id="row-blankrow" class="crm-section blankrow">
					<div class="label">&nbsp;&nbsp;</div>
					<div class="content">&nbsp;&nbsp;</div>
					<div class="clear"></div>
				</div>

				{if $groupID EQ 32 || $groupID EQ 42 || $groupID EQ 43 || $groupID EQ 44 || $groupID EQ 45}
					<div id="row-organization_name" class="crm-section organization_name-section">
						{if $row.Logo } 
						    <div class="label">{$row.Logo}</div> 
						{else}				
							<div class="label">Name:&nbsp;&nbsp;</div>
						{/if}
						<div class="content" align="justify"><h2>{$row.Organization}</h2></div>
						<div class="clear"></div>
					</div>
			    {else}
					<div id="row-contact_name" class="crm-section contact_name-section">
						{if $row.Image } 
						   <div class="label">{$row.Image}</div> 
						{else}				
							<div class="label">&nbsp;&nbsp;</div>
						{/if}
						<div class="content" align="justify"><h2>{$row.FirstName}&nbsp;{$row.LastName}</h2></div>
						<div class="clear"></div>
					</div>								
				{/if}
								
				{if $groupID EQ 32 || $groupID EQ 42 || $groupID EQ 43 || $groupID EQ 44 || $groupID EQ 45}
					<div id="row-street_address_Primary" class="crm-section street_address_Primary-section">
						<div class="label">Street:&nbsp;&nbsp;</div>
						<div class="content">{$row.Street}</div>
						<div class="clear"></div>
					</div>
				{/if}
				<div id="row-city_3" class="crm-section city_3-section">
					<div class="label">City:&nbsp;&nbsp;</div>
					<div class="content">{$row.City}</div>
					<div class="clear"></div>
				</div>
				<div id="row-postal_code_3" class="crm-section postal_code_3-section">
					<div class="label">Zipcode:&nbsp;&nbsp;</div>
					<div class="content">{$row.Zipcode}</a></div>
					<div class="clear"></div>
				</div>
				<div id="row-custom_1" class="crm-section custom_1-section">
					<div class="label">Region(s):&nbsp;&nbsp;</div>
					<div class="content">{$row.Region}</div>
					<div class="clear"></div>
				</div>
				<div id="row-email_Primary" class="crm-section email_Primary-section">
					<div class="label">Email:&nbsp;&nbsp;</div>
					<div class="content"><a href="mailto:{$row.Email}">{$row.Email}</a></div>
					<div class="clear"></div>
				</div>
				<div id="row-phone_Primary_1" class="crm-section phone_Primary_1-section">
					<div class="label">Phone:&nbsp;&nbsp;</div>
					<div class="content"><a href="tel:{$row.Phone}">{$row.Phone}</a></div>
					<div class="clear"></div>
				</div>

				<div id="row-blankrow" class="crm-section blankrow">
					<div class="label">&nbsp;&nbsp;</div>
					<div class="content">&nbsp;&nbsp;</div>
					<div class="clear"></div>
				</div>
				
				<div id="row-websitetypes" class="crm-section websitetypes-section">
				    <div class="label">Websites:&nbsp;&nbsp;</div>
					<div class="content">
					{if $row.Website } 
						{crmAPI var='result' entity='Website' action='get' contact_id=$row.ContactID website_type_id='Main'}
						{foreach from=$result.values item=website}
  						   <a target="_blank" href="{$website.url}"><img src='/wp-content/uploads/civicrm/ext/com.technochaos.websitesindirectory/images/website-icon.png' alt="Main Website" height="32" width="32" hspace="10" /></a>  
                        {/foreach}
					{/if}
					{if $row.Facebook } 
					 	{crmAPI var='result' entity='Website' action='get' contact_id=$row.ContactID website_type_id='Facebook'}
						{foreach from=$result.values item=website}
  						   <a target="_blank" href="{$website.url}"><img src='/wp-content/uploads/civicrm/ext/com.technochaos.websitesindirectory/images/facebook-icon.png' alt="Facebook" height="32" width="32" /></a>
                        {/foreach}
					{/if}
					{if $row.Twitter }
					 	{crmAPI var='result' entity='Website' action='get' contact_id=$row.ContactID website_type_id='Twitter'}
						{foreach from=$result.values item=website}
  						   <a target="_blank" href="{$website.url}"><img src="/wp-content/uploads/civicrm/ext/com.technochaos.websitesindirectory/images/twitter-icon.png" alt="Twitter" height="32" width="32" /></a> 
                        {/foreach}
					{/if}
					{if $row.LinkedIn } 
					 	{crmAPI var='result' entity='Website' action='get' contact_id=$row.ContactID website_type_id='LinkedIn'}
						{foreach from=$result.values item=website}
  						   <a target="_blank" href="{$website.url}"><img src="/wp-content/uploads/civicrm/ext/com.technochaos.websitesindirectory/images/linkedin-icon.png" alt="LinkedIn" height="32" width="32" /></a>  
                        {/foreach}
					{/if}
					{if $row.Instagram }
					 	{crmAPI var='result' entity='Website' action='get' contact_id=$row.ContactID website_type_id='Instagram'}
						{foreach from=$result.values item=website}
  						   <a target="_blank" href="{$website.url}"><img src="/wp-content/uploads/civicrm/ext/com.technochaos.websitesindirectory/images/instagram-icon.png" alt="Instagram" height="32" width="32" /></a>  
                        {/foreach}
					{/if}
					{if $row.GooglePlus } 
					 	{crmAPI var='result' entity='Website' action='get' contact_id=$row.ContactID website_type_id='Google+'}
						{foreach from=$result.values item=website}
  						   <a target="_blank" href="{$website.url}"><img src="/wp-content/uploads/civicrm/ext/com.technochaos.websitesindirectory/images/googleplus-icon.png" alt="GooglePlus" height="32" width="32" /></a>  
                        {/foreach}					 
					{/if}
					{if $row.Meetup } 
					 	{crmAPI var='result' entity='Website' action='get' contact_id=$row.ContactID website_type_id='Meetup'}
						{foreach from=$result.values item=website}
  						   <a target="_blank" href="{$website.url}"><img src="/wp-content/uploads/civicrm/ext/com.technochaos.websitesindirectory/images/meetup-icon.png" alt="Meetup" height="32" width="32" /></a> 
                        {/foreach}						 
					{/if}
					{if $row.Pinterest } 
					 	{crmAPI var='result' entity='Website' action='get' contact_id=$row.ContactID website_type_id='Pinterest'}
						{foreach from=$result.values item=website}
  						   <a target="_blank" href="{$website.url}"><img src="/wp-content/uploads/civicrm/ext/com.technochaos.websitesindirectory/images/pinterest-icon.png" alt="Pinterest" height="32" width="32" /></a>  
                        {/foreach}						 
					{/if}
					{if $row.YouTube } 
					 	{crmAPI var='result' entity='Website' action='get' contact_id=$row.ContactID website_type_id='YouTube'}
						{foreach from=$result.values item=website}
  						   <a target="_blank" href="{$website.url}"><img src="/wp-content/uploads/civicrm/ext/com.technochaos.websitesindirectory/images/youtube-icon.png" alt="YouTube" height="32" width="32" /></a> 
                        {/foreach}						 
					{/if}
					</div>
				</div>

				<div id="row-blankrow" class="crm-section blankrow">
					<div class="label">&nbsp;&nbsp;</div>
					<div class="content">&nbsp;&nbsp;</div>
					<div class="clear"></div>
				</div>
				
				<div id="row-custom_2" class="crm-section custom_2-section">
					<div class="label">Types of Making:&nbsp;&nbsp;</div>
					<div class="content">{$row.Types}</div>
					<div class="clear"></div>
				</div>
				<div id="row-custom_4" class="crm-section custom_4-section">
					<div class="label">Role(s):&nbsp;&nbsp;</div>
					<div class="content">{$row.Role}</div>
					<div class="clear"></div>
				</div>
				<div id="row-custom_6" class="crm-section custom_6-section">
					<div class="label">What? When? Where?&nbsp;&nbsp;</div>
					<div class="content">{$row.What}</div>
					<div class="clear"></div>
				</div>		
            </div>
  	    {else}			
            <div id="profilewrap{$groupID}" class="crm-profile-view">
    	    {$group.content}			
            </div>
		{/if}


    {/foreach}
	
	<div id="row-blankrow" class="crm-section blankrow">
		<div class="label">&nbsp;&nbsp;</div>
		<div class="content">&nbsp;&nbsp;</div>
		<div class="clear"></div>
	</div>

	
    <div class="action-link">
        {if $listingURL}
            <a href="{$listingURL}">&raquo; {ts}Back to Listings{/ts}</a>&nbsp;&nbsp;&nbsp;&nbsp;
        {/if}
        {if $mapURL}
            <a href="{$mapURL}">&raquo; {ts}Map Primary Address{/ts}</a>
        {/if}
    </div>
{/if}
{literal}
     <script type='text/javascript'>
          function contactImagePopUp (url, width, height) {
             newWindow = window.open( url,'name', 'width='+width+', height='+height );
          }
     </script>
{/literal}
