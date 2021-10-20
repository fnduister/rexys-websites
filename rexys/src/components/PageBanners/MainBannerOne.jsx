import React from 'react';
import AnchorLink from 'react-anchor-link-smooth-scroll';
import { useTranslation } from 'react-i18next';

const MainBanner = ({data}) => {
  const { t } = useTranslation();
  return (
    <div id="home" className="main-banner item-bg-one">
      <div className="d-table">
        <div className="d-table-cell">
          <div className="container">
            <div className="row">
              <div className="col-lg-12 col-md-12">
                <div className="main-banner-text">
                  <h4>{ data.title }</h4>
                  <h1>
                    {data.subtitle1}
                  </h1>
                  <p>{data.content}</p>
                  <AnchorLink
                    href="#more"
                    className="btn btn-primary view-work"
                    >
                    {data.accessProjectButton}
                  </AnchorLink>
                  <a
                    className="btn btn-primary"
                    href="https://seer-eye.com"

                  >
                    {data.viewProjectsButton}
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default MainBanner;
