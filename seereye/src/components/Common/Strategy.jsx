import React from 'react';
import { Link } from 'react-router-dom';

const Strategy = ({ data }) => {

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
                <h2><span>{data.subtitle}</span></h2>
                <p>{data.content}</p>
              </div>

              <ul>
                {data.strategyList.map((text) =>
                  <li><i className="fa fa-check"></i>{text}</li>
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