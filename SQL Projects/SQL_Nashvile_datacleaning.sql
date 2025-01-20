select * from NashvileHousing;

---- cleaning data in SQL Quaries
------------------------------------------------------------------------------------

--- take off the time function from saledate it makes no sense
--- adding an extra cloumn 
ALTER TABLE NashvileHousing
add SaleDateConverted DATE;

--updating the table new column with only date
update NashvileHousing
set SaleDateConverted=CONVERT(date,SaleDate)

--droping the saledate column
alter table NashvileHousing
drop column SaleDate;


--populate property address data 
--------------------------------------------------------------------------
-- modifying property address with same parcellID property address where it is null
select PropertyAddress from NashvileHousing;

select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress, isnull(a.PropertyAddress,b.PropertyAddress)
from NashvileHousing a
JOIN 
NashvileHousing b 
on a.ParcelID=b.ParcelID
and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null; 

update a
set a.PropertyAddress=isnull(a.PropertyAddress,b.PropertyAddress)
from NashvileHousing a
JOIN 
NashvileHousing b 
on a.ParcelID=b.ParcelID
and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null;

------------------------------------------------------------------------------------------------------------
--- Breaking down address into individual columns(address, city, state)

select SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) as address,
SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress)) as address
from NashvileHousing

--- create two columns
alter table NashvileHousing
add propertysplitaddress Nvarchar(255);

alter table NashvileHousing
add propertycityaddress Nvarchar(255);

--- updating the new created columns with respeted address
update NashvileHousing
set propertysplitaddress=SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1)

update NashvileHousing
set propertycityaddress=SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1)

-- dropping the old PropertyAddress column
alter table NashvileHousing
drop column PropertyAddress;
---------------------------------------------------------------------------------------------
-- to split owner addredss we use parsename 
-- it only looks for . as a delimator instead of , we replace , with . in parsename
select 
PARSENAME(REPLACE(owneraddress,',','.'),3)
,PARSENAME(REPLACE(owneraddress,',','.'),2)
,PARSENAME(REPLACE(owneraddress,',','.'),1)
from NashvileHousing;

-- create new columns
alter table nashvilehousing
add OwnerSplitstate varchar(255);

alter table nashvilehousing
add ownersplitcity varchar(255);

alter table nashvilehousing
add OwnerSplitaddress varchar(255);

update NashvileHousing
set OwnerSplitstate=PARSENAME(REPLACE(owneraddress,',','.'),1);

update NashvileHousing
set ownersplitcity=PARSENAME(REPLACE(owneraddress,',','.'),2);

update NashvileHousing
set Ownersplitaddress=PARSENAME(REPLACE(owneraddress,',','.'),3);

---------------------------------------------------------------------------------------------------------
--- change all Y and N to Yes and No in soldaVacant 
select SoldasVacant
, CASE when Soldasvacant ='Y' then 'Yes'
		when Soldasvacant ='N' then 'No'
		else soldasvacant 
		end 
from NashvileHousing;
------------------------------------------------------------------------------------------------------------------
----- removing duplicates
---- finding out duplicates with row numbering above 1 those which are duplicates 
with RowNumCTE as(
select *, 
	row_number() over(
	partition by parcelID,
				PropertyAddress,
				saleprice,
				saledate,
				legalreference
				order by 
				uniqueID
				)row_num 
from NashvileHousing
)
delete 
from RowNumCTE
where row_num>1;
---------------------------------------------------------------------------------------------------------
------- delete unused columns
alter table NashvileHousing
drop column propertyaddress, owneraddress, TaxDistrict

select * from NashvileHousing