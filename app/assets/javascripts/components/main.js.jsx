let Main = React.createClass({
  getInitialState() {
    return {
      description: this.props.description,
      email: this.props.email,
      phone: this.props.phone,
      country: this.props.country,
      state_province_county: this.props.state_province_county,
      city: this.props.city
    }
  },

  render() {
    return (
      <div>
        <Description description={this.state.description} />
        <ContactInfo email={this.state.email} phone={this.state.phone} />
        <Address
          country={this.state.country}
          state_province_county={this.state.state_province_county}
          city={this.state.city}/>
      </div>
    )
  }
});
