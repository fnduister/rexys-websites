import React from 'react';
import { Link } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

const Strategy = ({ data }) => {
  const { t } = useTranslation()

  return (
    <section id="strategy" className="strategy-area">
      <div className="container-fluid p-0">
        <div className="row ">
          <div className="col-lg-6 col-md-5">
            <div className="image"></div>
          </div>

          <div className="col-lg-6 col-md-7">
            <div className="about-strategy ptb-80">
              <div className="section-title">
                <h4>{data.title}</h4>
                <h2>{data.subtitle}</h2>
                <p>{data.content}</p>
              </div>

              <ul>
                {data.strategyList.map((line, i) =>
                  <li key={i}><i className="fa fa-check"></i>{line}</li>
                )}
              </ul>

            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Strategy;