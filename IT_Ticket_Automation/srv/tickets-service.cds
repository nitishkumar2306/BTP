using app.it_tickets as my from '../db/it_tickets_schema';

service Ticket_Service {
    entity Employee as projection on my.V_Employees;

    entity IT_Tickets as projection on my.V_IT_Tickets;

    entity Assigned_Support as projection on my.Assigned_Support;
}