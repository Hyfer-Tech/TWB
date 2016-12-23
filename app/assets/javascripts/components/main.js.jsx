let Main = React.createClass({
  getInitialState() {
    return {
      description: this.props.description,
      email: this.props.email,
      phone: this.props.phone,
      country: this.props.country,
      state_province_county: this.props.state_province_county,
      city: this.props.city,
      user_type_name: this.props.user_type_name
    }
  },

  render() {
    return (
      <div>
        <Description description={this.state.description} user_type_name={this.state.user_type_name} />
        <ContactInfo email={this.state.email} phone={this.state.phone} user_type_name={this.state.user_type_name}/>
        <Address
          country={this.state.country}
          state_province_county={this.state.state_province_county}
          city={this.state.city}
          user_type_name={this.state.user_type_name} />
      </div>
    )
  }
});
