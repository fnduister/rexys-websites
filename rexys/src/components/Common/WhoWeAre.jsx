import React from 'react';
import { useTranslation } from 'react-i18next';

const WhoWeAre = ({ data }) => {
  const { t } = useTranslation()
  return (
    <section id="whoweare" className="who-we-are ptb-80 bg-f6f6f6">
      <div className="container">
        <div className="section-title">
          <h2>{data.title}</h2>
          <p>{data.contentTitle}.</p>
        </div>

        <div className="row">
          <div className="col-lg-4 col-md-6">
            <div className="single-who-we-are">
              <i className="fa fa-users"></i>
              <h4>{data.boxContentCollection.items[0].title}</h4>
              <p>{data.boxContentCollection.items[0].content}</p>
              <span>1</span>
            </div>
          </div>

          <div className="col-lg-4 col-md-6">
            <div className="single-who-we-are">
              <i className="fa fa-lightbulb-o"></i>
              <h4>{data.boxContentCollection.items[1].title}</h4>
              <p>{data.boxContentCollection.items[2].content}</p>              <span>2</span>
            </div>
          </div>

          <div className="col-lg-4 col-md-6">
            <div className="single-who-we-are">
              <i className="fa fa-tag"></i>
              <h4>{data.boxContentCollection.items[2].title}</h4>
              <p>{data.boxContentCollection.items[2].content}</p>              <span>3</span >
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

export default WhoWeAre;