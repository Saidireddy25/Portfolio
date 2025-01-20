--select * from CovidDeaths;

-- select the data that we are going to be using now 

select location,date,total_cases, new_cases,total_deaths, population  
from CovidDeaths
order by 1,2;

-- looking at total cases vs total deaths 

select location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as deathPercentage 
from CovidDeaths
where location like '%states%'
order by 1,2;

-- looking at total cases vs poplulation 
-- shows what percentage of the population got covid
select location,date,total_cases,population, (total_cases/population)*100 as Percentpoplationinfected 
from CovidDeaths
where location like '%states%'
order by 1,2;

-- looking at contries with highest infection rate to population
select location,population,max(total_cases) as HighestinfectionCount, 
max((total_cases/population))*100 as Percentpoplationinfected 
from CovidDeaths
group by location,population
order by Percentpoplationinfected desc;

-- showing contries wiht highest death count per poplulation 

select location,MAX(cast(total_deaths as int)) as TotaldeathCount 
from CovidDeaths
where continent is not null
group by location
order by TotaldeathCount desc;

-- TOTAL DEATHS BY CONTINENT AS MAX
select location,MAX(cast(total_deaths as int)) as TotaldeathCount 
from CovidDeaths
where continent is null
group by location
order by TotaldeathCount desc;

-- showing continents with the heighest death count per population 

select continent,MAX(cast(total_deaths as int)) as TotaldeathCount 
from CovidDeaths
where continent is not null
group by continent
order by TotaldeathCount desc;

--global numbers per day 

select date,sum(new_cases) as total_cases , sum(cast(new_deaths as int)) as total_deaths,
sum(cast(new_deaths as int))/sum(new_cases)*100 as deathpercentage
from CovidDeaths
where continent is not null 
group by date 
order by 1,2;

select * from CovidVactinations;

-- join both tables

select * from CovidDeaths dea
join CovidVactinations vac 
on  dea.location=vac.location
and dea.date =vac.date;

-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3


-- Using CTE to perform Calculation on Partition By in previous query

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From CovidDeaths dea
Join CovidVactinations vac
On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac



-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From CovidDeaths dea
Join CovidVactinations vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated




-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From CovidDeaths dea
Join CovidVactinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 