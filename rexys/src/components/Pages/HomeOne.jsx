import React, { useEffect } from 'react';
import MainBanner from '../PageBanners/MainBannerOne';
import Strategy from '../Common/Strategy';
import WhoWeAre from '../Common/WhoWeAre';
import Ctr from '../Common/Ctr';
import Services from '../Common/Services';
import Contact from '../Common/Contact';
import Footer from '../Common/Footer';
import GoTop from '../Common/GoTop';
import useFetch from './../../hooks/useFetch';
import { query } from './../../graphql';
import { useTranslation } from 'react-i18next';

const HomeOne = () => {
  const { i18n } = useTranslation();

  const { loading, error, value } = useFetch(
    'https://graphql.contentful.com/content/v1/spaces/3vna8vgcj6wn/',
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer bj8cZ7df2tNC7SVoX-nJoyfPPIKyEwQGC1P_weiWN5Y',
      },
      body: JSON.stringify({ query: query(i18n.language) }),
    },
    [i18n.language]
  );

  return (
    <>
      {!value ? (
        <p>loading</p>
      ) : (
        <>
          <MainBanner data={value.data.webSite.headersCollection.items[0]} /> :
          <> {console.log('data', value.data)}</>
          {/* Main Banner */}
          {/* Services Area */}
          <Services data={value.data.webSite.sectionsCollection.items[0]} />
          {/* Strategy Area */}
          <Strategy data={value.data.webSite.sectionsCollection.items[2]} />
          {/* Who We Are Area */}
          <WhoWeAre data={value.data.webSite.sectionsCollection.items[1]} />
          {/* CTR Area */}
          <Ctr data={value.data.webSite.sectionsCollection.items[3]} />
          {/* Contact Area */}
          <Contact data={value.data.webSite.sectionsCollection.items[4]} />
          {/* Footer Area */}
          <Footer />
          <GoTop scrollStepInPx="50" delayInMs="16.66" />
        </>
      )}
    </>
  );
};

export default HomeOne;
