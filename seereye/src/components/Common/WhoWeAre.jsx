import React from 'react';

const WhoWeAre = ({ data }) => {
  return (
    <section id="whoweare" className="who-we-are ptb-80 bg-f6f6f6">
      <div className="container">
        <div className="section-title">
          <h2>{data.title}</h2>
          <p>{data.contentTitle}.</p>
        </div>

        <div className="row">
          {data.informationsCollection.items.map((item) =>

            <div className="col-lg-4 col-md-6">
              <div className="single-who-we-are">
                <i className="fa fa-users"></i>
                <h4>{item.title}</h4>
                <p>{item.content}</p>
                <span>1</span>
              </div>
            </div>
          )}

        </div>
      </div>
    </section>
  );
}

export default WhoWeAre;