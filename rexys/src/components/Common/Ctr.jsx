import React from 'react';
import AnchorLink from 'react-anchor-link-smooth-scroll';
import { useTranslation } from 'react-i18next';

const Ctr = ({data}) => {
    const { t } = useTranslation()
    return (
      <section className="ctr-area ptb-80" id="more">
        <div className="container">
          <div className="row">
            <div className="col-lg-12 col-md-12">
              <div className="section-title mb-0">
                <h2>{data.title}</h2>
                <p>{data.content}</p>
                <AnchorLink href="#download" className="btn btn-primary">
                  {data.downloadButton}
                </AnchorLink>
                <a
                  href="https://seer-eye.com"
                  className="btn btn-primary view-work"
                >
                  {data.accessProjectButton}
                </a>
              </div>
            </div>
          </div>
        </div>
      </section>
    );
};

export default Ctr;